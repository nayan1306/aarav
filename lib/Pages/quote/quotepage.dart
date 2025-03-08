import 'package:aarav/Pages/quote/quote_item_generator/work_and_productivity/perseverance_quotes.dart';
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
                // TODO: copy paste the same thing as below in rest of the Quote Tiles
                QuoteTile(
                  assetImagePath: "assets/images/sphere.png",
                  title: "Perseverance",
                  // TODO: Add the same on tap navigation after creating the quotes page
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => QuoteViewer.fromItems(
                              items:
                                  perseveranceQuotes, //TODO: change this name as the name mentioned in ref. lib/Pages/quote/quote_item_generator/work_and_productivity/perseverance_quotes.dart
                              //TODO:same for the one which you have created
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
