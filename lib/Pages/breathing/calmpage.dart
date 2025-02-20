import 'package:aarav/Pages/breathing/breathingpage3.dart';
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
                builder: (context) => BreathingPage3(totalDuration: 300),
              ), // 5 minutes
            );
          },
        ),
        SizedBox(width: 10),
        BreathingTile(
          assetImagePath: "assets/images/sphere.png",
          title: "Decompress",
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BreathingPage3(totalDuration: 300),
              ), // 5 minutes
            );
          },
        ),
        SizedBox(width: 10),
        BreathingTile(
          assetImagePath: "assets/images/sphere.png",
          title: "Decompress",
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BreathingPage3(totalDuration: 300),
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
          SizedBox(height: 20),
          _buildBreathingTileRow(),
          SizedBox(height: 20),
          _buildBreathingTileRow(),
        ],
      ),
    );
  }
}
