import 'package:aarav/Pages/breathing/breatingpage.dart';
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(104, 0, 0, 0),
        leading: Text(""),
        actions: [
          // IconButton(
          //   icon: const Icon(Icons.info_outline, color: Colors.white),
          //   onPressed: () {},
          // ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: ListView(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ExploreCard(
                  page: BreathingPage(), // Pass your page here
                  title: "Breathing", // Custom title
                  imagePath: "assets/images/test_bg.png", // Custom image
                ),
                ExploreCard(
                  page: Soundspage(), // Pass your page here
                  title: "Sound Therapy", // Custom title
                  imagePath: "assets/images/test_bg.png", // Custom image
                ),
                ExploreCard(
                  page: Soundspage(), // Pass your page here
                  title: "Quotes", // Custom title
                  imagePath: "assets/images/test_bg.png", // Custom image
                ),
                ExploreCard(
                  page: Soundspage(), // Pass your page here
                  title: "Affirmations", // Custom title
                  imagePath: "assets/images/test_bg.png", // Custom image
                ),
                ExploreCard(
                  page: Soundspage(), // Pass your page here
                  title: "Mood Tracker", // Custom title
                  imagePath: "assets/images/test_bg.png", // Custom image
                ),
                ExploreCard(
                  page: Soundspage(), // Pass your page here
                  title: "Journal", // Custom title
                  imagePath: "assets/images/test_bg.png", // Custom image
                ),

                ExploreCard(
                  page: Soundspage(), // Pass your page here
                  title: "Meditation", // Custom title
                  imagePath: "assets/images/test_bg.png", // Custom image
                ),
                ExploreCard(
                  page: Soundspage(), // Pass your page here
                  title: "AI ChatBot", // Custom title
                  imagePath: "assets/images/test_bg.png", // Custom image
                ),
                ExploreCard(
                  page: Soundspage(), // Pass your page here
                  title: "First Aid", // Custom title
                  imagePath: "assets/images/test_bg.png", // Custom image
                ),
              ],
            ),
          ),
        ],
      ),
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
          borderRadius: BorderRadius.circular(
            15,
          ), // Ensures ripple effect follows the shape
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => page),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(12), // Adds spacing inside the card
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10), // Rounded image
                  child: Image.asset(
                    imagePath, // Use the provided image path
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 18), // Space between image and text
                Text(
                  title, // Use the provided title
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
