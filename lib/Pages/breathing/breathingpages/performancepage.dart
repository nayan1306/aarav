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
      "title": "Focus Boost",
      "image": "assets/images/sphere.png",
      "durations": [3, 2, 3, 2],
    },
    {
      "title": "Energy Surge",
      "image": "assets/images/sphere.png",
      "durations": [4, 2, 4, 2],
    },
    {
      "title": "Clarity Flow",
      "image": "assets/images/sphere.png",
      "durations": [5, 3, 5, 3],
    },
    {
      "title": "Power Breath",
      "image": "assets/images/sphere.png",
      "durations": [3, 2, 3, 2],
    },
    {
      "title": "Peak State",
      "image": "assets/images/sphere.png",
      "durations": [4, 2, 4, 2],
    },
    {
      "title": "Mind Sharp",
      "image": "assets/images/sphere.png",
      "durations": [5, 3, 5, 3],
    },
    {
      "title": "Endurance Mode",
      "image": "assets/images/sphere.png",
      "durations": [3, 2, 3, 2],
    },
    {
      "title": "Performance Flow",
      "image": "assets/images/sphere.png",
      "durations": [4, 2, 4, 2],
    },
    {
      "title": "Ultimate Focus",
      "image": "assets/images/sphere.png",
      "durations": [5, 3, 5, 3],
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
