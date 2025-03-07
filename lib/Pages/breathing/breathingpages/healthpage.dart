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
      "title": "Refreshing",
      "image": "assets/images/breathing/health 300/Refreshing Breath.png",
      "durations": [5, 3, 6, 2],
    },
    {
      "title": "Immune Boost",
      "image": "assets/images/breathing/health 300/Immune Boost.png",
      "durations": [6, 4, 6, 3],
    },
    {
      "title": "Deep Healing",
      "image": "assets/images/breathing/health 300/Deep Healing Breath.png",
      "durations": [4, 5, 7, 3],
    },
    {
      "title": "Vital Flow",
      "image": "assets/images/breathing/health 300/Vital Flow Breath.png",
      "durations": [7, 4, 6, 3],
    },
    {
      "title": "Balanced Wellness",
      "image":
          "assets/images/breathing/health 300/Balanced Wellness Breath.png",
      "durations": [5, 5, 5, 3],
    },
    {
      "title": "Detox ",
      "image": "assets/images/breathing/health 300/Detox Breath.png",
      "durations": [4, 3, 6, 2],
    },
    {
      "title": "Lung Strengthening",
      "image":
          "assets/images/breathing/health 300/Lung Strengthening Breath.png",
      "durations": [6, 4, 8, 3],
    },
    {
      "title": "Circulation Booster",
      "image": "assets/images/breathing/health 300/Circulation Booster.png",
      "durations": [5, 3, 7, 2],
    },
    {
      "title": "Rejuvenation",
      "image": "assets/images/breathing/health 300/Rejuvenation Breath.png",
      "durations": [7, 5, 7, 3],
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
