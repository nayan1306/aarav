import 'package:aarav/Pages/breathing/breathingpage2.dart';
import 'package:aarav/widgets/breathinginfocard.dart';
import 'package:flutter/material.dart';

class BreathingLandingPage extends StatefulWidget {
  final String assetImagePath;
  final String title;
  final List<int> durations;

  const BreathingLandingPage({
    super.key,
    required this.assetImagePath,
    required this.title,
    required this.durations,
  });

  @override
  State<BreathingLandingPage> createState() => _BreathingLandingPageState();
}

class _BreathingLandingPageState extends State<BreathingLandingPage> {
  double _selectedDuration = 300; // Default duration (5 minutes)

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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05, // Adaptive padding
            vertical: screenHeight * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Title
              Text(
                widget.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenWidth * 0.08, // Adaptive font size
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 20),

              // Smooth Hero Animation Transition
              Hero(
                tag: widget.title,
                child: Container(
                  height: screenHeight * 0.35, // Adjust height based on screen
                  width: screenWidth * 0.8, // Adjust width
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.assetImagePath),
                      fit: BoxFit.contain,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Info Card (Adaptive Width)
              SizedBox(
                width: screenWidth * 0.9, // Scales based on screen
                child: BreathingInfoCardWidget(durations: widget.durations),
              ),

              const SizedBox(height: 20),

              // Duration Slider
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Column(
                  children: [
                    Text(
                      "Session Time : ${(_selectedDuration / 60).toStringAsFixed(0)} min",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.045, // Adaptive font
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Slider(
                      value: _selectedDuration,
                      min: 60, // 1 minute
                      max: 1800, // 30 minutes
                      divisions: 29, // Creates step of 1 minute
                      label:
                          "${(_selectedDuration / 60).toStringAsFixed(0)} min",
                      activeColor: const Color.fromARGB(255, 185, 255, 205),
                      onChanged: (value) {
                        setState(() {
                          _selectedDuration = value;
                        });
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Start Button (Adaptive Sizing)
              SizedBox(
                width: screenWidth * 0.6, // 60% of screen width
                height: screenHeight * 0.06, // Scales with screen
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => BreathingPage2(
                              totalDuration: _selectedDuration.toInt(),
                              durations: widget.durations,
                            ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 169, 255, 198),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Start",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: screenWidth * 0.05, // Adaptive font
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
