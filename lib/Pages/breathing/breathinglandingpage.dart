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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          Hero(
            tag: widget.title,
            child: Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.assetImagePath),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          const SizedBox(height: 30),
          BreathingInfoCardWidget(durations: widget.durations),
          const SizedBox(height: 20),

          // Duration Slider
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Text(
                  "Session Time : ${(_selectedDuration / 60).toStringAsFixed(0)} min ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Slider(
                  value: _selectedDuration,
                  min: 60, // 1 minute
                  max: 1800, // 30 minutes
                  divisions: 29, // Creates step of 1 minute
                  label: "${(_selectedDuration / 60).toStringAsFixed(0)} min",
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

          // Start Button
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => BreathingPage2(
                        totalDuration: 300,
                        durations: widget.durations,
                      ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 169, 255, 198),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              "Start",
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
