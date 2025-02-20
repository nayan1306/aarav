import 'package:aarav/Pages/breathing/breathingpages/calmpage.dart';
import 'package:aarav/Pages/breathing/breathingpages/energypage.dart';
import 'package:aarav/Pages/breathing/breathingpages/nighttimepage.dart';
import 'package:aarav/widgets/breathingcard.dart';
import 'package:aarav/widgets/breathingcontainercard.dart';
import 'package:flutter/material.dart';

class BreathingPage extends StatefulWidget {
  const BreathingPage({super.key});

  @override
  State<BreathingPage> createState() => _BreathingPageState();
}

class _BreathingPageState extends State<BreathingPage> {
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
                BreathingRecommendedCard(
                  assetImagePath:
                      "assets/images/breathing/box_breathing-removebg-preview-min.png",
                  title: "Deep Breathing",
                  subtitle: "Relax and inhale deeply",
                ),
                SizedBox(width: 10),
                BreathingRecommendedCard(
                  assetImagePath: "assets/images/breathing/clam.png",
                  title: "Deep Breathing",
                  subtitle: "Relax and inhale deeply",
                ),
                SizedBox(width: 10),
                BreathingRecommendedCard(
                  assetImagePath:
                      "assets/images/breathing/box_breathing-removebg-preview-min.png",
                  title: "Deep Breathing",
                  subtitle: "Relax and inhale deeply",
                ),
                SizedBox(width: 10),
                BreathingRecommendedCard(
                  assetImagePath: "assets/images/breathing/clam.png",
                  title: "Deep Breathing",
                  subtitle: "Relax and inhale deeply",
                ),
                SizedBox(width: 10),
              ],
            ),
          ),
          SizedBox(height: 20),
          Divider(color: const Color.fromARGB(97, 255, 255, 255)),
          // TODO: Change the title and subtitle and image Link
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BreathingContainerCard(
                assetImagePath:
                    "assets/images/breathing/box_breathing-removebg-preview-min.png",
                title: "Calm",
                subtitle: "Relax and inhale deeply",
                nextPage: CalmPage(),
              ),
              BreathingContainerCard(
                assetImagePath: "assets/images/breathing/clam.png",
                title: "Night Time",
                subtitle: "Relax and inhale deeply",
                nextPage: NightTimePage(),
              ),
            ],
          ),
          // repeted
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BreathingContainerCard(
                assetImagePath:
                    "assets/images/breathing/box_breathing-removebg-preview-min.png",
                title: "Energy",
                subtitle: "Relax and inhale deeply",
                nextPage: EnergyPage(),
              ),
              BreathingContainerCard(
                assetImagePath:
                    "assets/images/breathing/box_breathing-removebg-preview-min.png",
                title: "Calm",
                subtitle: "Relax and inhale deeply",
                nextPage: CalmPage(),
              ),
            ],
          ),
          //
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BreathingContainerCard(
                assetImagePath:
                    "assets/images/breathing/box_breathing-removebg-preview-min.png",
                title: "Calm",
                subtitle: "Relax and inhale deeply",
                nextPage: CalmPage(),
              ),
              BreathingContainerCard(
                assetImagePath:
                    "assets/images/breathing/box_breathing-removebg-preview-min.png",
                title: "Calm",
                subtitle: "Relax and inhale deeply",
                nextPage: CalmPage(),
              ),
            ],
          ),
          //
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BreathingContainerCard(
                assetImagePath:
                    "assets/images/breathing/box_breathing-removebg-preview-min.png",
                title: "Calm",
                subtitle: "Relax and inhale deeply",
                nextPage: CalmPage(),
              ),
              BreathingContainerCard(
                assetImagePath:
                    "assets/images/breathing/box_breathing-removebg-preview-min.png",
                title: "Calm",
                subtitle: "Relax and inhale deeply",
                nextPage: CalmPage(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
