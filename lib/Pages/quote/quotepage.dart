import 'package:aarav/Pages/breathing/breathinglandingpage.dart';
import 'package:aarav/Pages/breathing/breathingpage3.dart';
import 'package:aarav/widgets/breathingcard.dart';
import 'package:aarav/widgets/quotesrecommendedcard.dart';
import 'package:flutter/material.dart';

class QuotePage extends StatefulWidget {
  const QuotePage({super.key});

  @override
  State<QuotePage> createState() => _BreathingPageState();
}

class _BreathingPageState extends State<QuotePage> {
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
          const Text(
            "Recommended for you",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12), // Adds spacing
          // Wrap the horizontal ListView inside a SizedBox
          SizedBox(
            height: 160, // Set a fixed height to ensure visibility
            child: ListView(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: [
                QuotesRecommendedCard(
                  assetImagePath: "assets/images/test_bg.png",
                  title: "Top Quotes",
                  subtitle: "Gloabal top Quotes among users",
                ),
                SizedBox(width: 10),
                QuotesRecommendedCard(
                  assetImagePath: "assets/images/test_bg.png",
                  title: "Top Quotes",
                  subtitle: "Gloabal top Quotes among users",
                ),
                SizedBox(width: 10),
                QuotesRecommendedCard(
                  assetImagePath: "assets/images/test_bg.png",
                  title: "Top Quotes",
                  subtitle: "Gloabal top Quotes among users",
                ),
                SizedBox(width: 10),
                QuotesRecommendedCard(
                  assetImagePath: "assets/images/test_bg.png",
                  title: "Top Quotes",
                  subtitle: "Gloabal top Quotes among users",
                ),
                SizedBox(width: 10),
              ],
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              BreathingTileAnimated(
                assetImagePath: "assets/images/sphere.png",
                title: "Decompress",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => const BreathingLandingPage(
                            assetImagePath: "assets/images/sphere.png",
                            title: "Decompress",
                            durations: [4, 1, 4, 1],
                          ), // Navigate to BreathingLandingPage
                    ),
                  );
                },
              ),
              SizedBox(width: 10),
              BreathingTileAnimated(
                assetImagePath: "assets/images/sphere.png",
                title: "Sleep",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => const BreathingLandingPage(
                            assetImagePath: "assets/images/sphere.png",
                            title: "Sleep",
                            durations: [4, 1, 4, 1],
                          ), // Navigate to BreathingLandingPage
                    ),
                  );
                },
              ),
              SizedBox(width: 10),
              BreathingTileAnimated(
                assetImagePath: "assets/images/sphere.png",
                title: "Let go of worries",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => const BreathingLandingPage(
                            assetImagePath: "assets/images/sphere.png",
                            title: "Let go of worries",
                            durations: [4, 1, 4, 1],
                          ), // Navigate to BreathingLandingPage
                    ),
                  );
                },
              ),
            ],
          ),
          // TODO:Change all to animated tiles
          // repeated 2
          SizedBox(height: 20),
          Row(
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
          ),
          // repeated 3
          SizedBox(height: 20),
          Row(
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
          ),
          // repeated 4
          SizedBox(height: 20),
          Row(
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
          ),
        ],
      ),
    );
  }
}
