import 'dart:async';
import 'package:flutter/material.dart';

class BreathingPage4 extends StatefulWidget {
  final int totalDuration; // in seconds (e.g., 5 minutes = 300 seconds)

  const BreathingPage4({super.key, required this.totalDuration});

  @override
  State<BreathingPage4> createState() => _BreathingPage4State();
}

class _BreathingPage4State extends State<BreathingPage4>
    with TickerProviderStateMixin {
  late AnimationController _breathingController;
  late Timer _timer;

  int _remainingTime = 0;

  final List<Map<String, dynamic>> _breathingPattern = [
    {"phase": "Inhale", "duration": 4},
    {"phase": "Hold", "duration": 4}, // Increased Hold duration
    {"phase": "Exhale", "duration": 4},
    {"phase": "Hold", "duration": 4}, // Increased Hold duration
  ];
  int _patternIndex = 0;

  late Animation<double> _heightAnimation;

  // Track the previous phase to adjust hold logic
  String _previousPhase = "Inhale"; // Initial phase is Inhale

  @override
  void initState() {
    super.initState();
    _remainingTime = widget.totalDuration;
    _setupAnimation();
    _startTimer();
  }

  void _setupAnimation() {
    _breathingController = AnimationController(
      vsync: this,
      duration: Duration(seconds: _breathingPattern[_patternIndex]["duration"]),
    )..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _nextPhase();
      }
    });

    _updateAnimation();
    _breathingController.forward();
  }

  void _updateAnimation() {
    int duration = _breathingPattern[_patternIndex]["duration"];
    String phase = _breathingPattern[_patternIndex]["phase"];

    setState(() {}); // Rebuild on phase change

    if (phase == "Inhale") {
      // Line height increasing with smooth animation
      _heightAnimation = Tween<double>(begin: 0, end: 200).animate(
        CurvedAnimation(parent: _breathingController, curve: Curves.easeInOut),
      );
    } else if (phase == "Hold") {
      // Hold phase: Line stays the same height based on previous phase
      double startHeight = _previousPhase == "Exhale" ? 0 : 200;
      _heightAnimation = Tween<double>(
        begin: startHeight,
        end: startHeight,
      ).animate(
        CurvedAnimation(parent: _breathingController, curve: Curves.easeInOut),
      );
    } else if (phase == "Exhale") {
      // Line height decreasing with smooth animation
      _heightAnimation = Tween<double>(begin: 200, end: 0).animate(
        CurvedAnimation(parent: _breathingController, curve: Curves.easeInOut),
      );
    }

    // Update the controller's duration and start animation
    _breathingController.duration = Duration(seconds: duration);
    _breathingController.reset();
    _breathingController.forward();
  }

  void _nextPhase() {
    _previousPhase =
        _breathingPattern[_patternIndex]["phase"]; // Track the previous phase
    _patternIndex = (_patternIndex + 1) % _breathingPattern.length;
    _updateAnimation();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
      } else {
        _timer.cancel();
        _breathingController.stop();
      }
    });
  }

  @override
  void dispose() {
    _breathingController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: AnimatedBuilder(
                animation: _heightAnimation,
                builder: (context, child) {
                  return Container(
                    width: 50, // Fixed width for the line
                    height:
                        _heightAnimation
                            .value, // Line height changes with phases
                    color: Color.fromARGB(255, 187, 212, 255), // Line color
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  "Time Left: ${(_remainingTime ~/ 60).toString().padLeft(2, '0')}:${(_remainingTime % 60).toString().padLeft(2, '0')}",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
