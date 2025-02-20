import 'package:aarav/Pages/breathing/breathinglandingpage.dart';
import 'package:aarav/widgets/breathingcard.dart';
import 'package:flutter/material.dart';

class BoxBreathingPage extends StatefulWidget {
  const BoxBreathingPage({super.key});

  @override
  State<BoxBreathingPage> createState() => _CalmPageState();
}

class _CalmPageState extends State<BoxBreathingPage> {
  final List<Map<String, dynamic>> breathingExercises = [
    {"title": "Decompress", "image": "assets/images/sphere.png"},
    {"title": "Calm", "image": "assets/images/sphere.png"},
    {"title": "Free", "image": "assets/images/sphere.png"},
    {"title": "Decompress1", "image": "assets/images/sphere.png"},
    {"title": "Calm2", "image": "assets/images/sphere.png"},
    {"title": "Free3", "image": "assets/images/sphere.png"},
    {"title": "Decompress4", "image": "assets/images/sphere.png"},
    {"title": "Calm5", "image": "assets/images/sphere.png"},
    {"title": "Free6", "image": "assets/images/sphere.png"},
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
                  print("Tapped: ${exercise["title"]}"); // Debug log
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder:
                          (context) => BreathingLandingPage(
                            assetImagePath: exercise["image"],
                            title: exercise["title"],
                            durations: [2, 1, 2, 1],
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
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(height: 30),
          _buildBreathingTileRow(breathingExercises.sublist(0, 3)),
          const SizedBox(height: 30),
          _buildBreathingTileRow(breathingExercises.sublist(3, 6)),
          const SizedBox(height: 30),
          _buildBreathingTileRow(breathingExercises.sublist(6, 9)),
        ],
      ),
    );
  }
}
