import 'package:aarav/Pages/breathing/breathinglandingpage.dart';
import 'package:aarav/widgets/breathingcard.dart';
import 'package:flutter/material.dart';

class HealthPage extends StatefulWidget {
  const HealthPage({super.key});

  @override
  State<HealthPage> createState() => _HealthPageState();
}

class _HealthPageState extends State<HealthPage> {
  final List<Map<String, dynamic>> breathingExercises = [
    {
      "title": "Decompress",
      "image": "assets/images/sphere.png",
      "durations": [3, 2, 3, 2],
    },
    {
      "title": "Calm",
      "image": "assets/images/sphere.png",
      "durations": [4, 3, 4, 3],
    },
    {
      "title": "Free",
      "image": "assets/images/sphere.png",
      "durations": [5, 4, 5, 4],
    },
    {
      "title": "Relax",
      "image": "assets/images/sphere.png",
      "durations": [3, 2, 3, 2],
    },
    {
      "title": "Focus",
      "image": "assets/images/sphere.png",
      "durations": [4, 3, 4, 3],
    },
    {
      "title": "Refresh",
      "image": "assets/images/sphere.png",
      "durations": [5, 4, 5, 4],
    },
    {
      "title": "Energize",
      "image": "assets/images/sphere.png",
      "durations": [3, 2, 3, 2],
    },
    {
      "title": "Balance",
      "image": "assets/images/sphere.png",
      "durations": [4, 3, 4, 3],
    },
    {
      "title": "Harmony",
      "image": "assets/images/sphere.png",
      "durations": [5, 4, 5, 4],
    },
  ];

  Widget _buildBreathingTileRow(List<Map<String, dynamic>> items) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
          items.map((exercise) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
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
