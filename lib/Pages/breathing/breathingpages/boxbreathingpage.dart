import 'package:aarav/Pages/breathing/breathinglandingpage.dart';
import 'package:aarav/widgets/breathingcard.dart';
import 'package:flutter/material.dart';

class BoxBreathingPage extends StatefulWidget {
  const BoxBreathingPage({super.key});

  @override
  State<BoxBreathingPage> createState() => _BoxBreathingPageState();
}

class _BoxBreathingPageState extends State<BoxBreathingPage> {
  final List<Map<String, dynamic>> breathingExercises = [
    {
      "title": "Classic Box",
      "image": "assets/images/breathing/box 300/Classic Box Breath.png",
      "durations": [4, 4, 4, 4],
    },
    {
      "title": "Deep Focus",
      "image": "assets/images/breathing/box 300/Deep Focus Breath.png",
      "durations": [5, 5, 5, 5],
    },
    {
      "title": "Calm and Steady",
      "image": "assets/images/breathing/box 300/Calm and Steady Breath.png",
      "durations": [6, 6, 6, 6],
    },
    {
      "title": "Mental Reset",
      "image": "assets/images/breathing/box 300/Mental Reset Breath.png",
      "durations": [4, 6, 4, 6],
    },
    {
      "title": "Endurance Box",
      "image": "assets/images/breathing/box 300/Endurance Box Breath.png",
      "durations": [7, 5, 7, 5],
    },
    {
      "title": "Balanced Control",
      "image": "assets/images/breathing/box 300/balanced Control Breath.png",
      "durations": [5, 5, 6, 4],
    },
    {
      "title": "Grounding",
      "image": "assets/images/breathing/box 300/Grounding Breath.png",
      "durations": [6, 6, 8, 5],
    },
    {
      "title": "Stress Relief Box",
      "image": "assets/images/breathing/box 300/Stress Relief Box.png",
      "durations": [4, 7, 4, 7],
    },
    {
      "title": "Powerful Presence",
      "image": "assets/images/breathing/box 300/Powerful Presence Breath.png",
      "durations": [8, 6, 8, 6],
    },
  ];

  Widget _buildBreathingTileRow(List<Map<String, dynamic>> items) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
          items
              .map(
                (exercise) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
                  child: BreathingTileAnimated(
                    assetImagePath: exercise["image"],
                    title: exercise["title"],
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder:
                              (context) => BreathingLandingPage(
                                assetImagePath: exercise["image"],
                                title: exercise["title"],
                                durations: exercise["durations"],
                              ),
                        ),
                      );
                    },
                  ),
                ),
              )
              .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: const BackButton(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(screenHeight * 0.01),
        children: [
          SizedBox(height: screenHeight * 0.04),
          _buildBreathingTileRow(breathingExercises.sublist(0, 3)),
          SizedBox(height: screenHeight * 0.04),
          _buildBreathingTileRow(breathingExercises.sublist(3, 6)),
          SizedBox(height: screenHeight * 0.04),
          _buildBreathingTileRow(breathingExercises.sublist(6, 9)),
        ],
      ),
    );
  }
}
