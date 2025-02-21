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
                  color: Colors.black.withOpacity(0.8),
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
                              "Mood Score: ${moodSummary.moodScore} ${getMoodEmoji(moodSummary.moodScore)}",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color:
                                    moodSummary.moodScore > 5
                                        ? Colors.greenAccent
                                        : Colors.redAccent,
                              ),
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

                        const SizedBox(height: 8),

                        // Selected Reasons
                        if (moodSummary.selectedReasons.isNotEmpty)
                          _buildLabeledContainer(
                            "Reasons",
                            moodSummary.selectedReasons
                                .map((reason) => reason.values.join(', '))
                                .toList(),
                            Colors.orangeAccent,
                          ),

                        // Selected Feelings
                        if (moodSummary.selectedFeelings.isNotEmpty)
                          _buildLabeledContainer(
                            "Feelings",
                            moodSummary.selectedFeelings
                                .map((feeling) => feeling.values.join(', '))
                                .toList(),
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

  // Widget to create labeled container with chips for reasons & feelings
  Widget _buildLabeledContainer(
    String title,
    List<String> items,
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
          Container(
            padding: const EdgeInsets.all(8),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: borderColor, width: 1.5),
            ),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children:
                  items
                      .map(
                        (item) => Chip(
                          label: Text(
                            item,
                            style: const TextStyle(color: Colors.white),
                          ),
                          backgroundColor: borderColor.withOpacity(0.5),
                          side: BorderSide(color: borderColor, width: 2),
                        ),
                      )
                      .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
