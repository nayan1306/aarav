import 'package:aarav/Pages/breathing/breathinglandingpage.dart';
import 'package:aarav/widgets/breathingcard.dart';
import 'package:flutter/material.dart';

class EnergyPage extends StatefulWidget {
  const EnergyPage({super.key});

  @override
  State<EnergyPage> createState() => _EnergyPageState();
}

// TODO: change everything as per the context
class _EnergyPageState extends State<EnergyPage> {
  final List<Map<String, dynamic>> breathingExercises = [
    {
      "title": "Power",
      "image": "assets/images/breathing/energy 300/Power Breath.png",
      "durations": [5, 2, 4, 1],
    },
    {
      "title": "Energizing Wave",
      "image": "assets/images/breathing/energy 300/Energizing Wave.png",
      "durations": [6, 3, 4, 2],
    },
    {
      "title": "Vitality Boost",
      "image": "assets/images/breathing/energy 300/Vitality Boost.png",
      "durations": [4, 4, 4, 2],
    },
    {
      "title": "Morning Charge",
      "image": "assets/images/breathing/energy 300/Morning Charge.png",
      "durations": [7, 4, 5, 2],
    },
    {
      "title": "Awakening",
      "image": "assets/images/breathing/energy 300/Awakening Breath.png",
      "durations": [5, 3, 3, 1],
    },
    {
      "title": "Quick Refresh",
      "image": "assets/images/breathing/energy 300/Quick Refresh.png",
      "durations": [3, 2, 3, 1],
    },
    {
      "title": "Invigorating Rhythm",
      "image": "assets/images/breathing/energy 300/Invigorating Rhythm.png",
      "durations": [6, 3, 4, 2],
    },
    {
      "title": "Dynamic Flow",
      "image": "assets/images/breathing/energy 300/Dynamic Flow.png",
      "durations": [4, 2, 3, 1],
    },
    {
      "title": "Fire Up",
      "image": "assets/images/breathing/energy 300/Fire Up Breath.png",
      "durations": [7, 5, 5, 2],
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
