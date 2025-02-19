import 'package:aarav/Pages/quote/quoteviewer.dart';
import 'package:aarav/widgets/quotesrecommendedcard.dart';
import 'package:aarav/widgets/quotetile.dart';
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
          Text(
            "Work and Productivity",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 130,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              children: [
                QuoteTile(
                  assetImagePath: "assets/images/sphere.png",
                  title: "Perseverance",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => QuoteViewer(
                              quotes: [
                                "The only limit to our realization of tomorrow is our doubts of today.",
                                "Success is not final, failure is not fatal: it is the courage to continue that counts.",
                                "Believe in yourself and all that you are.",
                              ],
                              imagePaths: [
                                "assets/images/wp.jpg",
                                "assets/images/test_bg.png",
                                "assets/images/wp.jpg",
                              ],
                            ),
                      ),
                    );
                  },
                ),
                QuoteTile(
                  assetImagePath: "assets/images/sphere.png",
                  title: "Determination",
                  onTap: () {},
                ),
                QuoteTile(
                  assetImagePath: "assets/images/sphere.png",
                  title: "Resilience",
                  onTap: () {},
                ),
                QuoteTile(
                  assetImagePath: "assets/images/sphere.png",
                  title: "Courage",
                  onTap: () {},
                ),
                QuoteTile(
                  assetImagePath: "assets/images/sphere.png",
                  title: "Resilience",
                  onTap: () {},
                ),
                QuoteTile(
                  assetImagePath: "assets/images/sphere.png",
                  title: "Courage",
                  onTap: () {},
                ),
              ],
            ),
          ),
          // TDOD: Add bouncing scroll physics and change the sections accordingly
          Text(
            "Physical Health",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 130,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                QuoteTile(
                  assetImagePath: "assets/images/sphere.png",
                  title: "Perseverance",
                  onTap: () {},
                ),
                QuoteTile(
                  assetImagePath: "assets/images/sphere.png",
                  title: "Determination",
                  onTap: () {},
                ),
                QuoteTile(
                  assetImagePath: "assets/images/sphere.png",
                  title: "Resilience",
                  onTap: () {},
                ),
                QuoteTile(
                  assetImagePath: "assets/images/sphere.png",
                  title: "Courage",
                  onTap: () {},
                ),
                QuoteTile(
                  assetImagePath: "assets/images/sphere.png",
                  title: "Resilience",
                  onTap: () {},
                ),
                QuoteTile(
                  assetImagePath: "assets/images/sphere.png",
                  title: "Courage",
                  onTap: () {},
                ),
              ],
            ),
          ),
          // TDOD: Add bouncing scroll physics and change the sections accordingly
          Text(
            "Physical Health",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 130,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                QuoteTile(
                  assetImagePath: "assets/images/sphere.png",
                  title: "Perseverance",
                  onTap: () {},
                ),
                QuoteTile(
                  assetImagePath: "assets/images/sphere.png",
                  title: "Determination",
                  onTap: () {},
                ),
                QuoteTile(
                  assetImagePath: "assets/images/sphere.png",
                  title: "Resilience",
                  onTap: () {},
                ),
                QuoteTile(
                  assetImagePath: "assets/images/sphere.png",
                  title: "Courage",
                  onTap: () {},
                ),
                QuoteTile(
                  assetImagePath: "assets/images/sphere.png",
                  title: "Resilience",
                  onTap: () {},
                ),
                QuoteTile(
                  assetImagePath: "assets/images/sphere.png",
                  title: "Courage",
                  onTap: () {},
                ),
              ],
            ),
          ),
          // TDOD: Add bouncing scroll physics and change the sections accordingly
          Text(
            "Physical Health",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 130,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                QuoteTile(
                  assetImagePath: "assets/images/sphere.png",
                  title: "Perseverance",
                  onTap: () {},
                ),
                QuoteTile(
                  assetImagePath: "assets/images/sphere.png",
                  title: "Determination",
                  onTap: () {},
                ),
                QuoteTile(
                  assetImagePath: "assets/images/sphere.png",
                  title: "Resilience",
                  onTap: () {},
                ),
                QuoteTile(
                  assetImagePath: "assets/images/sphere.png",
                  title: "Courage",
                  onTap: () {},
                ),
                QuoteTile(
                  assetImagePath: "assets/images/sphere.png",
                  title: "Resilience",
                  onTap: () {},
                ),
                QuoteTile(
                  assetImagePath: "assets/images/sphere.png",
                  title: "Courage",
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
