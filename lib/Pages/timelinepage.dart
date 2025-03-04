import 'dart:developer';
import 'package:aarav/widgets/mood_calendar.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

import '../models/mood_summary_model.dart';

class TimelinePage extends StatefulWidget {
  const TimelinePage({super.key});

  @override
  State<TimelinePage> createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage> {
  late Map<DateTime, String> moodEmojis = {};
  // final DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _loadMoodData();
  }

  void _loadMoodData() {
    final moodSummaryBox = Hive.box<MoodSummary>('moodSummaries');
    log(moodSummaryBox.length.toString());

    Map<DateTime, String> tempMap = {};
    for (int i = 0; i < moodSummaryBox.length; i++) {
      final moodSummary = moodSummaryBox.getAt(i);
      if (moodSummary != null) {
        // DateTime date = DateTime.parse(moodSummary.timestamp);
        // DateTime onlyDate = DateTime(date.year, date.month, date.day);
        // You can update moodEmojis mapping here if needed
        // tempMap[onlyDate] = getMoodEmoji(moodSummary.moodScore);
      }
    }

    setState(() {
      moodEmojis = tempMap;
    });
  }

  Map<String, dynamic> getMoodDetails(int moodScore) {
    if (moodScore >= 8) {
      return {"emoji": "😃", "text": "Very Happy", "color": Colors.green};
    } else if (moodScore >= 5) {
      return {"emoji": "😊", "text": "Neutral", "color": Colors.orange};
    } else {
      return {"emoji": "😞", "text": "Sad", "color": Colors.red};
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
          MoodCalendar(),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: ValueListenableBuilder(
                valueListenable:
                    Hive.box<MoodSummary>('moodSummaries').listenable(),
                builder: (context, Box<MoodSummary> box, _) {
                  // Retrieve all mood records and sort them from new to old.
                  final allMoodRecords =
                      box.values.toList()..sort(
                        (a, b) => DateTime.parse(
                          b.timestamp,
                        ).compareTo(DateTime.parse(a.timestamp)),
                      );

                  if (allMoodRecords.isEmpty) {
                    return const Center(
                      child: Text(
                        "No mood records available.",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: allMoodRecords.length,
                    itemBuilder: (context, index) {
                      final moodSummary = allMoodRecords[index];
                      final moodDetails = getMoodDetails(moodSummary.moodScore);

                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        color: const Color.fromARGB(
                          255,
                          37,
                          35,
                          35,
                        ).withOpacity(0.8),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        moodDetails["emoji"],
                                        style: const TextStyle(fontSize: 28),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        moodDetails["text"],
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: moodDetails["color"],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    DateFormat('MMM dd, yyyy h:mm a').format(
                                      DateTime.parse(moodSummary.timestamp),
                                    ),
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              // Mood Score with Progress Bar
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Mood Score",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: LinearProgressIndicator(
                                      value: moodSummary.moodScore / 10,
                                      backgroundColor: Colors.grey.shade700,
                                      valueColor: AlwaysStoppedAnimation(
                                        moodDetails["color"],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    "${moodSummary.moodScore}/10",
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
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
