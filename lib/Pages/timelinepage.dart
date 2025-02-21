import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import '../models/mood_summary_model.dart';

class TimelinePage extends StatelessWidget {
  const TimelinePage({super.key});

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
    final moodSummaryBox = Hive.box<MoodSummary>('moodSummaries');

    return Scaffold(
      appBar: AppBar(
        title: const Text("Mood History"),
        centerTitle: true,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ValueListenableBuilder(
          valueListenable: moodSummaryBox.listenable(),
          builder: (context, Box<MoodSummary> box, _) {
            if (box.isEmpty) {
              return const Center(
                child: Text(
                  "No mood summaries recorded yet.",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              );
            }

            return ListView.builder(
              itemCount: box.length,
              itemBuilder: (context, index) {
                final moodSummary = box.getAt(index);
                if (moodSummary == null) return const SizedBox.shrink();

                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: const Color.fromARGB(255, 48, 47, 47).withOpacity(0.8),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Mood Score with Emoji
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              getMoodEmoji(moodSummary.moodScore),
                              style: const TextStyle(fontSize: 24),
                            ),
                            Text(
                              DateFormat(
                                'MMM d, y - h:mm a',
                              ).format(DateTime.parse(moodSummary.timestamp)),
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),

                        // const SizedBox(height: 10),

                        // Text(
                        //   "Mood Score: ${moodSummary.moodScore}",
                        //   style: TextStyle(
                        //     fontSize: 18,
                        //     fontWeight: FontWeight.bold,
                        //     color:
                        //         moodSummary.moodScore > 5
                        //             ? Colors.greenAccent
                        //             : Colors.redAccent,
                        //   ),
                        // ),

                        // const SizedBox(height: 8),

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
    );
  }

  // Widget to create labeled container with expandable chips
  Widget _buildLabeledContainer(
    String title,
    List<Map<String, String>> items, // [{"emoji": "😀", "text": "Joyful"}]
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

          // Chip List
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: List.generate(items.length, (index) {
              final item = items[index];
              final emoji = item["emoji"] ?? "";
              final text = item["text"] ?? "";

              // ValueNotifier for individual chip state
              ValueNotifier<bool> isExpanded = ValueNotifier(false);

              return ValueListenableBuilder<bool>(
                valueListenable: isExpanded,
                builder: (context, expanded, _) {
                  return GestureDetector(
                    onTap: () => isExpanded.value = !isExpanded.value,
                    child: Chip(
                      label: Text(
                        expanded ? "$emoji $text" : emoji,
                        style: const TextStyle(color: Colors.white),
                      ),
                      backgroundColor: borderColor.withOpacity(0.5),
                      side: BorderSide(color: borderColor, width: 2),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
