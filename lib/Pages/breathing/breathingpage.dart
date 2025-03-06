import 'package:aarav/Pages/breathing/breathingpages/boxbreathingpage.dart';
import 'package:aarav/Pages/breathing/breathingpages/calmpage.dart';
import 'package:aarav/Pages/breathing/breathingpages/energypage.dart';
import 'package:aarav/Pages/breathing/breathingpages/healthpage.dart';
import 'package:aarav/Pages/breathing/breathingpages/nighttimepage.dart';
import 'package:aarav/Pages/breathing/breathingpages/performancepage.dart';
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
    double screenWidth = MediaQuery.of(context).size.width;
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
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.04,
        ), // Adaptive padding
        child: ListView(
          children: [
            SizedBox(height: screenHeight * 0.02),
            Text(
              "Recommended for you",
              style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth * 0.045, // Adaptive font size
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeight * 0.015), // Responsive spacing
            // Horizontal Scroll View for Recommended Cards
            SizedBox(
              height: screenHeight * 0.22, // Dynamic height
              child: ListView(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [
                  BreathingRecommendedCard(
                    assetImagePath: "assets/images/breathing/calm.png",
                    title: "Calm",
                    subtitle: "Breathe slowly, ease your mind",
                  ),
                  SizedBox(width: screenWidth * 0.03),
                  BreathingRecommendedCard(
                    assetImagePath: "assets/images/breathing/energy.png",
                    title: "Energy",
                    subtitle: "Recharge with deep breaths.",
                  ),
                  SizedBox(width: screenWidth * 0.03),
                  BreathingRecommendedCard(
                    assetImagePath:
                        "assets/images/breathing/night_time-removebg-preview.png",
                    title: "Night Time",
                    subtitle: "Prepare for restful sleep.",
                  ),
                  SizedBox(width: screenWidth * 0.03),
                  BreathingRecommendedCard(
                    assetImagePath:
                        "assets/images/breathing/box_breathing-removebg-preview.png",
                    title: "Box Breathing",
                    subtitle: "Find balance in every breath",
                  ),
                ],
              ),
            ),

            SizedBox(height: screenHeight * 0.01),
            Divider(color: Colors.white.withOpacity(0.4), thickness: 1),
            SizedBox(height: screenHeight * 0.01),

            // Breathing Container Cards (Grid Layout)
            Wrap(
              spacing: screenWidth * 0.04,
              runSpacing: screenHeight * 0.02,
              alignment: WrapAlignment.center,
              children: [
                BreathingContainerCard(
                  assetImagePath: "assets/images/breathing/calm.png",
                  title: "Calm",
                  subtitle: "Breathe slowly, ease your mind",
                  nextPage: CalmPage(),
                ),
                BreathingContainerCard(
                  assetImagePath:
                      "assets/images/breathing/night_time-removebg-preview.png",
                  title: "Night Time",
                  subtitle: "Prepare for restful sleep.",
                  nextPage: NightTimePage(),
                ),
                BreathingContainerCard(
                  assetImagePath: "assets/images/breathing/energy.png",
                  title: "Energy",
                  subtitle: "Recharge with deep breaths.",
                  nextPage: EnergyPage(),
                ),
                BreathingContainerCard(
                  assetImagePath: "assets/images/breathing/peformance.png",
                  title: "Performance",
                  subtitle: "Sharpen your focus.",
                  nextPage: PerformancePage(),
                ),
                BreathingContainerCard(
                  assetImagePath: "assets/images/breathing/health.png",
                  title: "Health",
                  subtitle: "Breathe for better well-being",
                  nextPage: HealthPage(),
                ),
                BreathingContainerCard(
                  assetImagePath:
                      "assets/images/breathing/box_breathing-removebg-preview.png",
                  title: "Box Breathing",
                  subtitle: "Find balance in every breath",
                  nextPage: BoxBreathingPage(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
