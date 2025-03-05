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
      "title": "Night Relax",
      "image": "assets/images/sphere.png",
      "durations": [4, 2, 4, 2],
    },
    {
      "title": "Calm Night",
      "image": "assets/images/sphere.png",
      "durations": [5, 3, 5, 3],
    },
    {
      "title": "Free Mind",
      "image": "assets/images/sphere.png",
      "durations": [6, 4, 6, 4],
    },
    {
      "title": "Deep Sleep",
      "image": "assets/images/sphere.png",
      "durations": [4, 2, 4, 2],
    },
    {
      "title": "Dream State",
      "image": "assets/images/sphere.png",
      "durations": [5, 3, 5, 3],
    },
    {
      "title": "Tranquil Night",
      "image": "assets/images/sphere.png",
      "durations": [6, 4, 6, 4],
    },
    {
      "title": "Peaceful Rest",
      "image": "assets/images/sphere.png",
      "durations": [4, 2, 4, 2],
    },
    {
      "title": "Serene Sleep",
      "image": "assets/images/sphere.png",
      "durations": [5, 3, 5, 3],
    },
    {
      "title": "Silent Night",
      "image": "assets/images/sphere.png",
      "durations": [6, 4, 6, 4],
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
