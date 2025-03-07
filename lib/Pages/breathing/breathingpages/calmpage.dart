import 'package:aarav/Pages/breathing/breathinglandingpage.dart';
import 'package:aarav/widgets/breathingcard.dart';
import 'package:flutter/material.dart';

class CalmPage extends StatefulWidget {
  const CalmPage({super.key});

  @override
  State<CalmPage> createState() => _CalmPageState();
}

class _CalmPageState extends State<CalmPage> {
  final List<Map<String, dynamic>> breathingExercises = [
    {
      "title": "Peaceful Mind",
      "image": "assets/images/breathing/calm 300/peaceful mind.png",
      "durations": [4, 4, 6, 2],
    },
    {
      "title": "Deep Stillness",
      "image": "assets/images/breathing/calm 300/deep stilness.png",
      "durations": [5, 5, 7, 3],
    },
    {
      "title": "Quiet Focus",
      "image": "assets/images/breathing/calm 300/quite focus.png",
      "durations": [4, 6, 8, 4],
    },
    {
      "title": "Balanced Flow",
      "image": "assets/images/breathing/calm 300/balance flow.png",
      "durations": [6, 6, 6, 6],
    },
    {
      "title": "Tranquil Mind",
      "image": "assets/images/breathing/calm 300/Tranquil mind.png",
      "durations": [4, 7, 8, 4],
    },
    {
      "title": "Gentle Calm",
      "image": "assets/images/breathing/calm 300/gentle calm.png",
      "durations": [3, 3, 6, 3],
    },
    {
      "title": "Serene Rhythm",
      "image": "assets/images/breathing/calm 300/serene rhythm.png",
      "durations": [5, 5, 7, 4],
    },
    {
      "title": "Harmony",
      "image": "assets/images/breathing/calm 300/harmony.png",
      "durations": [6, 4, 8, 4],
    },
    {
      "title": "Stillness",
      "image": "assets/images/breathing/calm 300/stillness.png",
      "durations": [5, 7, 5, 3],
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
