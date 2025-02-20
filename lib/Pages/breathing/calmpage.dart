import 'package:aarav/Pages/breathing/breathinglandingpage.dart';
import 'package:aarav/widgets/breathingcard.dart';
import 'package:flutter/material.dart';

class CalmPage extends StatefulWidget {
  const CalmPage({super.key});

  @override
  State<CalmPage> createState() => _DeepBreathingPageState();
}

class _DeepBreathingPageState extends State<CalmPage> {
  Widget _buildBreathingTileRow() {
    return Row(
      children: [
        BreathingTile(
          assetImagePath: "assets/images/sphere.png",
          title: "Decompress",
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => BreathingLandingPage(
                      assetImagePath: "assets/images/sphere.png",
                      title: "Decompress",
                      durations: [2, 1, 2, 1],
                    ),
              ), // 5 minutes
            );
          },
        ),
        SizedBox(width: 10),
        BreathingTile(
          assetImagePath: "assets/images/sphere.png",
          title: "Calm",
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => BreathingLandingPage(
                      assetImagePath: "assets/images/sphere.png",
                      title: "Calm",
                      durations: [2, 1, 2, 1],
                    ),
              ), // 5 minutes
            );
          },
        ),
        SizedBox(width: 10),
        BreathingTile(
          assetImagePath: "assets/images/sphere.png",
          title: "free",
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => BreathingLandingPage(
                      assetImagePath: "assets/images/sphere.png",
                      title: "free",
                      durations: [2, 1, 2, 1],
                    ),
              ), // 5 minutes
            );
          },
        ),
      ],
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
          _buildBreathingTileRow(),
          SizedBox(height: 50),
          _buildBreathingTileRow(),
          SizedBox(height: 50),
          _buildBreathingTileRow(),
        ],
      ),
    );
  }
}
