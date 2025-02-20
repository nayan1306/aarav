import 'package:aarav/Pages/moodtracker.dart/moodpages/moodpage10.dart';
import 'package:flutter/material.dart';

// Dummy pages for different mood scores
class HappyDetailsPage extends StatelessWidget {
  final int moodScore;
  const HappyDetailsPage({super.key, required this.moodScore});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Happy Mood Details")),
      body: Center(child: Text("Happy Mood Score: $moodScore")),
    );
  }
}

class SadDetailsPage extends StatelessWidget {
  final int moodScore;
  const SadDetailsPage({super.key, required this.moodScore});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sad Mood Details")),
      body: Center(child: Text("Sad Mood Score: $moodScore")),
    );
  }
}

class NeutralDetailsPage extends StatelessWidget {
  final int moodScore;
  const NeutralDetailsPage({super.key, required this.moodScore});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Neutral Mood Details")),
      body: Center(child: Text("Neutral Mood Score: $moodScore")),
    );
  }
}

// Main Mood Tracker Page
class MoodTrackerPage extends StatefulWidget {
  final String moodImage;
  final String message;
  final int moodScore;

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
    _moodNoteController.dispose();
    super.dispose();
  }

  void _navigateToDetails() {
    Widget page;
    if (widget.moodScore == 10) {
      page = MoodPage10(moodScore: widget.moodScore);
    } else if (widget.moodScore >= 7) {
      page = HappyDetailsPage(moodScore: widget.moodScore);
    } else if (widget.moodScore <= 3) {
      page = SadDetailsPage(moodScore: widget.moodScore);
    } else {
      page = NeutralDetailsPage(moodScore: widget.moodScore);
    }

    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  void _saveWithoutDetails() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Color.fromARGB(167, 192, 255, 119),

        content: Text(
          "Mood Status updated!",
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(milliseconds: 400),
      ),
    );
    Future.delayed(const Duration(milliseconds: 500), () {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),

                    Text(
                      widget.message,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 10),

                    Text(
                      "Mood Score: ${widget.moodScore}",
                      style: const TextStyle(
                        color: Colors.greenAccent,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20),

                    Hero(
                      tag: "moodImage",
                      child: ScaleTransition(
                        scale: _scaleAnimation,
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
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
                          borderSide: const BorderSide(
                            color: Colors.greenAccent,
                          ),
                        ),
                      ),
                      maxLines: 5,
                    ),

                    const SizedBox(height: 20),

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
                          onPressed: _navigateToDetails,
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
                          onPressed: _saveWithoutDetails,
                          child: const Text("Save without Details"),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
