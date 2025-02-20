import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MoodSummaryPage extends StatelessWidget {
  final int moodScore;
  final List<String> selectedReasons;
  final List<String> selectedFeelings;

  MoodSummaryPage({
    super.key,
    required this.moodScore,
    required this.selectedReasons,
    required this.selectedFeelings,
  });

  // Get the current date and time in a formatted way
  final String currentTime = DateFormat(
    'EEEE, MMM d, y - h:mm a',
  ).format(DateTime.now());

  // Mood Interpretation Based on Score
  String getMoodMessage() {
    if (moodScore >= 8) {
      return "You're feeling amazing! Keep up the positive vibes!";
    } else if (moodScore >= 5) {
      return "You're doing okay! Stay positive and keep pushing forward.";
    } else {
      return "It's okay to have tough days. Take a deep breath and be kind to yourself.";
    }
  }

  // Mood Trend Indicator
  String getMoodTrend() {
    if (moodScore >= 8) {
      return "You're on a positive streak!";
    } else if (moodScore >= 5) {
      return "Your mood is stable. Keep maintaining balance!";
    } else {
      return "You might need some relaxation or a little self-care.";
    }
  }

  // Encouraging Quotes
  String getEncouragingQuote() {
    if (moodScore >= 8) {
      return "✨ 'Happiness depends upon ourselves.' - Aristotle";
    } else if (moodScore >= 5) {
      return "🌱 'Every day may not be good, but there's something good in every day.'";
    } else {
      return "🌿 'Your feelings are valid. Healing takes time. Be gentle with yourself.'";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Mood Summary"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // Background Gradient
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF1E1E1E), Color(0xFF121212)],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 100),

                  // Current Time Display
                  Center(
                    child: Text(
                      currentTime,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Mood Score Display with Glowing Effect
                  Center(
                    child: Column(
                      children: [
                        const Text(
                          "Your Mood Score",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color:
                                moodScore > 5
                                    ? Colors.greenAccent.withOpacity(0.3)
                                    : Colors.redAccent.withOpacity(0.3),
                            boxShadow: [
                              BoxShadow(
                                color:
                                    moodScore > 5
                                        ? Colors.greenAccent.withOpacity(0.6)
                                        : Colors.redAccent.withOpacity(0.6),
                                blurRadius: 20,
                                spreadRadius: 5,
                              ),
                            ],
                          ),
                          child: Text(
                            moodScore.toString(),
                            style: TextStyle(
                              color:
                                  moodScore > 5
                                      ? const Color.fromARGB(255, 239, 239, 239)
                                      : const Color.fromARGB(255, 0, 0, 0),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Mood Interpretation
                  Center(
                    child: Text(
                      getMoodMessage(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Mood Trend Indicator
                  Center(
                    child: Text(
                      getMoodTrend(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.amberAccent,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
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
                      letterSpacing: 1.2,
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
                                backgroundColor: const Color.fromARGB(
                                  255,
                                  92,
                                  134,
                                  45,
                                ),
                                side: const BorderSide(
                                  color: Colors.greenAccent,
                                ),
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
                      letterSpacing: 1.2,
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
                                backgroundColor: Colors.blueAccent.withOpacity(
                                  0.3,
                                ),
                                side: const BorderSide(
                                  color: Colors.blueAccent,
                                ),
                              ),
                            )
                            .toList(),
                  ),

                  const SizedBox(height: 50),

                  // Encouraging Quote
                  Center(
                    child: Text(
                      getEncouragingQuote(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),

                  const SizedBox(height: 50),

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
          ],
        ),
      ),
    );
  }
}
