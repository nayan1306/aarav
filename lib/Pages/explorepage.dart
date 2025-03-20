import 'dart:ui';
import 'package:aarav/Pages/affirmations/affirmation_page.dart';
import 'package:aarav/Pages/breathing/breathingpage.dart';
import 'package:aarav/Pages/journal/journalpage.dart';
import 'package:aarav/Pages/moodtracker.dart/tracker_placeholder_page.dart';
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
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const SizedBox(),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 10, 13, 35),
                  Color.fromARGB(255, 0, 0, 0),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          ListView(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.1,
              bottom: MediaQuery.of(context).size.height * 0.1,
            ),
            children: [
              Center(
                child: Column(
                  children: const [
                    ExploreCard(
                      page: BreathingPage(),
                      title: "Breathing",
                      imagePath: "assets/images/explore/Dixh1hsJ.png",
                    ),
                    ExploreCard(
                      page: Soundspage(),
                      title: "Sound Therapy",
                      imagePath: "assets/images/explore/i6qNXlnF.png",
                    ),
                    ExploreCard(
                      page: QuotePage(),
                      title: "Quotes",
                      imagePath: "assets/images/explore/53YQ_SiC.png",
                    ),
                    ExploreCard(
                      page: AffirmationPage(),
                      title: "Affirmations",
                      imagePath: "assets/images/explore/l1RHwcBR.png",
                    ),
                    ExploreCard(
                      page: TrackerPlaceholderPage(),
                      title: "Mood Tracker",
                      imagePath: "assets/images/explore/-oiuJJ9Y.png",
                    ),
                    ExploreCard(
                      page: JournalPage(),
                      title: "Journal",
                      imagePath: "assets/images/explore/DBuCMH1h.png",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ExploreCard extends StatefulWidget {
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
  State<ExploreCard> createState() => _ExploreCardState();
}

class _ExploreCardState extends State<ExploreCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
      lowerBound: 0.0,
      upperBound: 0.03,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.97,
    ).animate(_scaleController);
  }

  @override
  void dispose() {
    _scaleController.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    _scaleController.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _scaleController.reverse();
  }

  void _onTapCancel() {
    _scaleController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
      child: GestureDetector(
        onTapDown: _onTapDown,
        onTapUp: (details) {
          _onTapUp(details);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => widget.page),
          );
        },
        onTapCancel: _onTapCancel,
        child: AnimatedBuilder(
          animation: _scaleController,
          builder:
              (context, child) =>
                  Transform.scale(scale: _scaleAnimation.value, child: child),
          child: Card(
            color: Colors.white.withOpacity(0.15),
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                child: Padding(
                  padding: EdgeInsets.all(
                    MediaQuery.of(context).size.width * 0.04,
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          widget.imagePath,
                          width: MediaQuery.of(context).size.width * 0.15,
                          height: MediaQuery.of(context).size.height * 0.07,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                      Expanded(
                        child: Text(
                          widget.title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white70,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
