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
                          _buildDetailRow(
                            "Reasons",
                            moodSummary.selectedReasons,
                            Icons.label,
                          ),

                        // Selected Feelings
                        if (moodSummary.selectedFeelings.isNotEmpty)
                          _buildDetailRow(
                            "Feelings",
                            moodSummary.selectedFeelings,
                            Icons.mood,
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

  // Widget to create labeled detail rows
  Widget _buildDetailRow(String title, List<String> items, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.blueAccent, size: 18),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              "$title: ${items.join(", ")}",
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
