import 'package:aarav/Pages/breathing/breathinglandingpage.dart';
import 'package:aarav/widgets/breathingcard.dart';
import 'package:flutter/material.dart';

class NightTimePage extends StatefulWidget {
  const NightTimePage({super.key});

  @override
  State<NightTimePage> createState() => _NightTimePageState();
}

// TODO: change everything as per the context
class _NightTimePageState extends State<NightTimePage> {
  final List<Map<String, dynamic>> breathingExercises = [
    {
      "title": "Calm Night",
      "image": "assets/images/breathing/night 300/calm night.png",
      "durations": [4, 7, 8, 3],
    },
    {
      "title": "Deep Sleep",
      "image": "assets/images/breathing/night 300/deep sleep.png",
      "durations": [5, 5, 10, 4],
    },
    {
      "title": "Dream State",
      "image": "assets/images/breathing/night 300/dream state.png",
      "durations": [4, 6, 8, 4],
    },
    {
      "title": "Free Mind",
      "image": "assets/images/breathing/night 300/free mind.png",
      "durations": [6, 6, 8, 4],
    },
    {
      "title": "Night Relax",
      "image": "assets/images/breathing/night 300/night relax.png",
      "durations": [4, 8, 10, 5],
    },
    {
      "title": "Peaceful Rest",
      "image": "assets/images/breathing/night 300/peaceful rest.png",
      "durations": [3, 3, 6, 3],
    },
    {
      "title": "Serene Sleep",
      "image": "assets/images/breathing/night 300/serene sleep.png",
      "durations": [5, 7, 9, 4],
    },
    {
      "title": "Silent Night",
      "image": "assets/images/breathing/night 300/silent night.png",
      "durations": [6, 4, 10, 5],
    },
    {
      "title": "Tranquil Night",
      "image": "assets/images/breathing/night 300/tranquil night.png",
      "durations": [5, 8, 6, 3],
    },
  ];

  Widget _buildBreathingTileRow(List<Map<String, dynamic>> items) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
          items.map((exercise) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: BreathingTileAnimated(
                assetImagePath: exercise["image"],
                title: exercise["title"],
                onTap: () {
                  print("Tapped: ${exercise["title"]}");
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
            );
          }).toList(),
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
