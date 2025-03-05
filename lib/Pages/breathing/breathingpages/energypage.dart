import 'package:aarav/Pages/breathing/breathinglandingpage.dart';
import 'package:aarav/widgets/breathingcard.dart';
import 'package:flutter/material.dart';

class EnergyPage extends StatefulWidget {
  const EnergyPage({super.key});

  @override
  State<EnergyPage> createState() => _EnergyPageState();
}

class _EnergyPageState extends State<EnergyPage> {
  final List<Map<String, dynamic>> energyExercises = [
    {
      "title": "Energize",
      "image": "assets/images/energy.png",
      "durations": [2, 2, 2, 2],
    },
    {
      "title": "Invigorate",
      "image": "assets/images/energy.png",
      "durations": [3, 3, 3, 3],
    },
    {
      "title": "Recharge",
      "image": "assets/images/energy.png",
      "durations": [4, 4, 4, 4],
    },
    {
      "title": "Boost",
      "image": "assets/images/energy.png",
      "durations": [2, 2, 2, 2],
    },
    {
      "title": "Uplift",
      "image": "assets/images/energy.png",
      "durations": [3, 3, 3, 3],
    },
    {
      "title": "Revitalize",
      "image": "assets/images/energy.png",
      "durations": [4, 4, 4, 4],
    },
    {
      "title": "Stimulate",
      "image": "assets/images/energy.png",
      "durations": [2, 2, 2, 2],
    },
    {
      "title": "Awaken",
      "image": "assets/images/energy.png",
      "durations": [3, 3, 3, 3],
    },
    {
      "title": "Power Up",
      "image": "assets/images/energy.png",
      "durations": [4, 4, 4, 4],
    },
  ];

  Widget _buildEnergyTileRow(List<Map<String, dynamic>> items) {
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
        backgroundColor: Colors.orange.shade700,
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
          _buildEnergyTileRow(energyExercises.sublist(0, 3)),
          SizedBox(height: screenHeight * 0.04),
          _buildEnergyTileRow(energyExercises.sublist(3, 6)),
          SizedBox(height: screenHeight * 0.04),
          _buildEnergyTileRow(energyExercises.sublist(6, 9)),
        ],
      ),
    );
  }
}
