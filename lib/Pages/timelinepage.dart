import 'package:aarav/widgets/mood_calendar.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';

import '../models/mood_summary_model.dart';

class TimelinePage extends StatefulWidget {
  const TimelinePage({super.key});

  @override
  State<TimelinePage> createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage> {
  late Map<DateTime, String> moodEmojis = {};
  final DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _loadMoodData();
  }

  void _loadMoodData() {
    final moodSummaryBox = Hive.box<MoodSummary>('moodSummaries');

    // Extract mood summaries and map them to dates
    Map<DateTime, String> tempMap = {};
    for (int i = 0; i < moodSummaryBox.length; i++) {
      final moodSummary = moodSummaryBox.getAt(i);
      if (moodSummary != null) {
        DateTime date = DateTime.parse(moodSummary.timestamp);
        DateTime onlyDate = DateTime(date.year, date.month, date.day);
        tempMap[onlyDate] = getMoodEmoji(moodSummary.moodScore);
      }
    }

    setState(() {
      moodEmojis = tempMap;
    });
  }

  String getMoodEmoji(int moodScore) {
    if (moodScore >= 8) {
      return "😃"; // Very Happy
    } else if (moodScore >= 5) {
      return "😊"; // Neutral/Okay
    } else {
      return "😞"; // Sad
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mood History"),
        centerTitle: true,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Calendar Widget
          MoodCalendar(),

          // Show moods recorded on the selected date
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: ValueListenableBuilder(
                valueListenable:
                    Hive.box<MoodSummary>('moodSummaries').listenable(),
                builder: (context, Box<MoodSummary> box, _) {
                  final selectedDateString = DateFormat(
                    'yyyy-MM-dd',
                  ).format(_selectedDate);
                  final moodsOnSelectedDate =
                      box.values.where((mood) {
                        return mood.timestamp.startsWith(selectedDateString);
                      }).toList();

                  if (moodsOnSelectedDate.isEmpty) {
                    return const Center(
                      child: Text(
                        "No mood records for this date.",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: moodsOnSelectedDate.length,
                    itemBuilder: (context, index) {
                      final moodSummary = moodsOnSelectedDate[index];

                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        color: Colors.black.withOpacity(0.8),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    getMoodEmoji(moodSummary.moodScore),
                                    style: const TextStyle(fontSize: 24),
                                  ),
                                  Text(
                                    DateFormat('yyyy-MM-dd h:mm a').format(
                                      DateTime.parse(moodSummary.timestamp),
                                    ),
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 10),

                              // Mood Score
                              Text(
                                "Mood Score: ${moodSummary.moodScore}",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      moodSummary.moodScore > 5
                                          ? Colors.greenAccent
                                          : Colors.redAccent,
                                ),
                              ),

                              const SizedBox(height: 8),

                              // Selected Reasons
                              if (moodSummary.selectedReasons.isNotEmpty)
                                _buildLabeledContainer(
                                  "Reasons",
                                  moodSummary.selectedReasons,
                                  Colors.orangeAccent,
                                ),

                              // Selected Feelings
                              if (moodSummary.selectedFeelings.isNotEmpty)
                                _buildLabeledContainer(
                                  "Feelings",
                                  moodSummary.selectedFeelings,
                                  Colors.blueAccent,
                                ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabeledContainer(
    String title,
    List<Map<String, String>> items,
    Color borderColor,
  ) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
          const SizedBox(height: 6),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children:
                items.map((item) {
                  final emoji = item["emoji"] ?? "";
                  final text = item["text"] ?? "";
                  ValueNotifier<bool> isExpanded = ValueNotifier(false);

                  return ValueListenableBuilder<bool>(
                    valueListenable: isExpanded,
                    builder: (context, expanded, _) {
                      return GestureDetector(
                        onTap: () => isExpanded.value = !isExpanded.value,
                        child: Chip(
                          label: Text(expanded ? "$emoji $text" : emoji),
                          backgroundColor: borderColor.withOpacity(0.5),
                          side: BorderSide(color: borderColor, width: 2),
                        ),
                      );
                    },
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }
}
