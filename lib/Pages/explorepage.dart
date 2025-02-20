import 'package:aarav/Pages/breathing/breathingpage.dart';
import 'package:aarav/Pages/quote/quotepage.dart';
import 'package:aarav/Pages/sounds/soundspage.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // The entire page content
        Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(104, 0, 0, 0),
            elevation: 0,
            leading: const SizedBox(),
          ),
          body: ListView(
            padding: const EdgeInsets.only(
              top: 80,
            ), // Ensure content starts below the AppBar
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    ExploreCard(
                      page: BreathingPage(),
                      title: "Breathing",
                      imagePath: "assets/images/test_bg.png",
                    ),
                    ExploreCard(
                      page: Soundspage(),
                      title: "Sound Therapy",
                      imagePath: "assets/images/test_bg.png",
                    ),
                    ExploreCard(
                      page: QuotePage(),
                      title: "Quotes",
                      imagePath: "assets/images/test_bg.png",
                    ),
                    ExploreCard(
                      page: QuotePage(),
                      title: "Affirmations",
                      imagePath: "assets/images/test_bg.png",
                    ),
                    ExploreCard(
                      page: Soundspage(),
                      title: "Mood Tracker",
                      imagePath: "assets/images/test_bg.png",
                    ),
                    ExploreCard(
                      page: Soundspage(),
                      title: "Journal",
                      imagePath: "assets/images/test_bg.png",
                    ),
                    ExploreCard(
                      page: Soundspage(),
                      title: "Meditation",
                      imagePath: "assets/images/test_bg.png",
                    ),
                    ExploreCard(
                      page: Soundspage(),
                      title: "AI ChatBot",
                      imagePath: "assets/images/test_bg.png",
                    ),
                    ExploreCard(
                      page: Soundspage(),
                      title: "First Aid",
                      imagePath: "assets/images/test_bg.png",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ExploreCard extends StatelessWidget {
  final Widget page;
  final String title;
  final String imagePath;

  const ExploreCard({
    super.key,
    required this.page,
    required this.title,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: const Color.fromARGB(93, 218, 242, 255),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15), // Rounded corners
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => page),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(12), // Inner spacing
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10), // Rounded image
                  child: Image.asset(
                    imagePath,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 18), // Space between image and text
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
