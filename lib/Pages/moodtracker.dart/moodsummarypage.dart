import 'package:aarav/mainscreen.dart';
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

  final String currentTime = DateFormat(
    'EEEE, MMM d, y - h:mm a',
  ).format(DateTime.now());

  String getMoodMessage() {
    if (moodScore >= 8) {
      return "You're feeling amazing! Keep up the positive vibes!";
    } else if (moodScore >= 5) {
      return "You're doing okay! Stay positive and keep pushing forward.";
    } else {
      return "It's okay to have tough days. Take a deep breath and be kind to yourself.";
    }
  }

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
        centerTitle: true,
        backgroundColor: const Color.fromARGB(212, 0, 0, 0),
        elevation: 2,
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF1E1E1E), Color(0xFF121212)],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 100),

                      // Current Time Display
                      Text(
                        currentTime,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Mood Score Box
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color:
                                moodScore > 5
                                    ? Colors.greenAccent
                                    : Colors.redAccent,
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color:
                                  moodScore > 5
                                      ? Colors.greenAccent.withOpacity(0.5)
                                      : Colors.redAccent.withOpacity(0.5),
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Mood Score : ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              moodScore.toString(),
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color:
                                    moodScore > 5
                                        ? Colors.greenAccent
                                        : Colors.redAccent,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 30),

                      // Mood Message Box
                      _buildInfoBox(getMoodMessage()),

                      const SizedBox(height: 20),

                      // Selected Reasons
                      _buildLabeledContainer(
                        "Reasons for Your Mood",
                        selectedReasons,
                        const Color.fromARGB(255, 35, 128, 83),
                      ),

                      const SizedBox(height: 20),

                      // Selected Feelings
                      _buildLabeledContainer(
                        "Your Exact Feelings",
                        selectedFeelings,
                        Colors.blueAccent,
                      ),

                      const SizedBox(height: 40),

                      // Encouraging Quote
                      _buildInfoBox(getEncouragingQuote()),

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),

            // Fixed Done Button at Bottom
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MainScreen(initialIndex: 2),
                  ),
                  (route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 20,
                ),
                minimumSize: const Size(300, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: const Color.fromARGB(167, 42, 214, 126),
              ),
              child: const Text(
                "Done",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                  color: Colors.white,
                ),
              ),
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Utility method to create bordered info boxes
  Widget _buildInfoBox(String text, {Color color = Colors.white70}) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color, width: 1.5),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: color,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // Utility method to create labeled chip containers
  Widget _buildLabeledContainer(
    String title,
    List<String> items,
    Color borderColor,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(color: Colors.white, fontSize: 16)),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(12),
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
    );
  }
}
