import 'package:flutter/material.dart';

class MoodTrackerPage extends StatefulWidget {
  final String moodImage;
  final String message; // 🟢 Custom message
  final int moodScore; // 🟢 Integer value

  const MoodTrackerPage({
    super.key,
    required this.moodImage,
    required this.message,
    required this.moodScore,
  });

  @override
  State<MoodTrackerPage> createState() => _MoodTrackerPageState();
}

class _MoodTrackerPageState extends State<MoodTrackerPage>
    with SingleTickerProviderStateMixin {
  final TextEditingController _moodNoteController = TextEditingController();
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
      lowerBound: 0.6,
      upperBound: 1.0,
    )..forward();
    _scaleAnimation = CurvedAnimation(
      parent: _scaleController,
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 40),

            // 🌟 Show Custom Message
            Text(
              widget.message, // 🟢 Display the passed message
              style: const TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 10),

            // 🟢 Show Mood Score
            Text(
              "Mood Score: ${widget.moodScore}", // Display the integer value
              style: const TextStyle(
                color: Colors.greenAccent,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            // 🌟 Animated Mood Image
            Hero(
              tag: "moodImage",
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(
                          0,
                          0,
                          0,
                          0,
                        ).withOpacity(0.2),
                        blurRadius: 15,
                        spreadRadius: 5,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(widget.moodImage, height: 180),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // 📝 Mood Note Input Field
            TextField(
              controller: _moodNoteController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Write about your mood...",
                hintStyle: TextStyle(color: Colors.grey[500]),
                filled: true,
                fillColor: Colors.grey[900],
                contentPadding: const EdgeInsets.all(15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Colors.greenAccent),
                ),
              ),
              maxLines: 5,
            ),

            const SizedBox(height: 240),

            // 🔘 Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 5,
                  ),
                  onPressed: () {
                    String moodNote = _moodNoteController.text;
                    print("Saved Mood Note: $moodNote");
                  },
                  child: const Text("Add Details"),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.greenAccent),
                    foregroundColor: Colors.greenAccent,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    _moodNoteController.clear();
                  },
                  child: const Text("Save without Details"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
