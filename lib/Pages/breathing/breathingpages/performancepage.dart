import 'package:aarav/Pages/breathing/breathinglandingpage.dart';
import 'package:aarav/widgets/breathingcard.dart';
import 'package:flutter/material.dart';

class PerformancePage extends StatefulWidget {
  const PerformancePage({super.key});

  @override
  State<PerformancePage> createState() => _PerformancePageState();
}

// TODO: change everything as per the context
class _PerformancePageState extends State<PerformancePage> {
  final List<Map<String, dynamic>> breathingExercises = [
    {
      "title": "Endurance Flow",
      "image": "assets/images/breathing/peformance 300/Endurance Flow.png",
      "durations": [4, 4, 6, 3],
    },
    {
      "title": "Flow State Breath",
      "image": "assets/images/breathing/peformance 300/Flow State Breath.png",
      "durations": [5, 2, 4, 2],
    },
    {
      "title": "Focus Booster",
      "image": "assets/images/breathing/peformance 300/Focus Booster.png",
      "durations": [5, 3, 5, 2],
    },
    {
      "title": "Mental Clarity Breath",
      "image":
          "assets/images/breathing/peformance 300/mental clarity breath.png",
      "durations": [6, 4, 6, 3],
    },
    {
      "title": "Peak Performance",
      "image": "assets/images/breathing/peformance 300/Peak Performance.png",
      "durations": [6, 4, 6, 2],
    },
    {
      "title": "Power Rhythm",
      "image": "assets/images/breathing/peformance 300/Power Rhythm.png",
      "durations": [4, 3, 4, 2],
    },
    {
      "title": "Sharpen Focus Breath",
      "image":
          "assets/images/breathing/peformance 300/Sharpen Focus Breath.png",
      "durations": [5, 5, 5, 2],
    },
    {
      "title": "Steady Mind Breath",
      "image": "assets/images/breathing/peformance 300/Steady Mind Breath.png",
      "durations": [7, 4, 5, 3],
    },
    {
      "title": "Precision Breath",
      "image": "assets/images/breathing/peformance 300/precision breath.png",
      "durations": [7, 5, 6, 3],
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
