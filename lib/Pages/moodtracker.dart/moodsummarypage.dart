import 'package:flutter/material.dart';

class MoodSummaryPage extends StatelessWidget {
  final int moodScore;
  final List<String> selectedReasons;
  final List<String> selectedFeelings;

  const MoodSummaryPage({
    super.key,
    required this.moodScore,
    required this.selectedReasons,
    required this.selectedFeelings,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Mood Summary"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            // Mood Score
            Center(
              child: Column(
                children: [
                  const Text(
                    "Your Mood Score",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    moodScore.toString(),
                    style: TextStyle(
                      color:
                          moodScore > 5 ? Colors.greenAccent : Colors.redAccent,
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Selected Reasons
            const Text(
              "Reasons for Your Mood",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children:
                  selectedReasons
                      .map(
                        (reason) => Chip(
                          label: Text(
                            reason,
                            style: const TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.greenAccent.withOpacity(0.3),
                          side: const BorderSide(color: Colors.greenAccent),
                        ),
                      )
                      .toList(),
            ),

            const SizedBox(height: 20),

            // Selected Feelings
            const Text(
              "Your Exact Feelings",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children:
                  selectedFeelings
                      .map(
                        (feeling) => Chip(
                          label: Text(
                            feeling,
                            style: const TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.blueAccent.withOpacity(0.3),
                          side: const BorderSide(color: Colors.blueAccent),
                        ),
                      )
                      .toList(),
            ),

            const SizedBox(height: 40),

            // Done Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text("Done"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
