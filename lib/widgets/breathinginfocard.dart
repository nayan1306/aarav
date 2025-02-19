import 'dart:ui';
import 'package:flutter/material.dart';

class BreathingInfoCardWidget extends StatelessWidget {
  final List<int> durations; // Only durations are passed

  const BreathingInfoCardWidget({super.key, required this.durations})
    : assert(durations.length == 4, "Exactly 4 durations are required.");

  @override
  Widget build(BuildContext context) {
    // Static labels and images
    final List<String> labels = ["Inhale", "Hold", "Exhale", "Hold"];
    final List<String> icons = [
      "assets/images/breathing.png",
      "assets/images/lips.png",
      "assets/images/breathing.png",
      "assets/images/lips.png",
    ];

    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Blur effect
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            color: Colors.white.withOpacity(0.3), // Semi-transparent background
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Static row of breathing steps
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(4, (index) {
                      return Column(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(icons[index], width: 40, height: 40),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "${durations[index]}s",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            labels[index],
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
