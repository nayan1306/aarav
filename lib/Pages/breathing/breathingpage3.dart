import 'dart:async';
import 'package:flutter/material.dart';

class BreathingPage3 extends StatefulWidget {
  final int totalDuration; // in seconds (e.g., 5 minutes = 300 seconds)
  const BreathingPage3({super.key, required this.totalDuration});

  @override
  State<BreathingPage3> createState() => _BreathingPage3State();
}

class _BreathingPage3State extends State<BreathingPage3>
    with TickerProviderStateMixin {
  late AnimationController _breathingController;
  late Timer _timer;
  int _remainingTime = 0;
  String _currentPhase = "Inhale";

  final List<Map<String, dynamic>> _breathingPattern = [
    {"phase": "Inhale", "duration": 2},
    {"phase": "Hold", "duration": 1},
    {"phase": "Exhale", "duration": 2},
  ];
  int _patternIndex = 0;

  late Animation<double> _sizeAnimation;
  late Animation<double> _rippleAnimation;
  late Animation<double> _rippleOffsetAnimation;
  late Animation<Color?> _colorAnimation;

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

    setState(() {
      _currentPhase = phase;
    });

    // Use a curved animation for smoother transitions.
    final curvedAnimation = CurvedAnimation(
      parent: _breathingController,
      curve: Curves.easeInOutSine,
    );

    if (phase == "Inhale") {
      _sizeAnimation = Tween<double>(
        begin: 100,
        end: 200,
      ).animate(curvedAnimation);
      _rippleAnimation = Tween<double>(
        begin: 0,
        end: 300,
      ).animate(curvedAnimation);
      _colorAnimation = ColorTween(
        begin: Colors.blue,
        end: Colors.green,
      ).animate(curvedAnimation);
      // Animate the extra ripple offset from 0 to 150 during inhale.
      _rippleOffsetAnimation = Tween<double>(
        begin: 0,
        end: 150,
      ).animate(curvedAnimation);
    } else if (phase == "Hold") {
      _sizeAnimation = Tween<double>(
        begin: 200,
        end: 200,
      ).animate(curvedAnimation);
      _rippleAnimation = Tween<double>(
        begin: 300,
        end: 300,
      ).animate(curvedAnimation);
      _colorAnimation = ColorTween(
        begin: Colors.green,
        end: Colors.yellow,
      ).animate(curvedAnimation);
      _rippleOffsetAnimation = AlwaysStoppedAnimation(150);
    } else if (phase == "Exhale") {
      _sizeAnimation = Tween<double>(
        begin: 200,
        end: 100,
      ).animate(curvedAnimation);
      _rippleAnimation = Tween<double>(
        begin: 300,
        end: 0,
      ).animate(curvedAnimation);
      _colorAnimation = ColorTween(
        begin: Colors.yellow,
        end: Colors.red,
      ).animate(curvedAnimation);
      // Animate the extra offset from 150 to 0 smoothly during exhale.
      _rippleOffsetAnimation = Tween<double>(
        begin: 150,
        end: 10,
      ).animate(curvedAnimation);
    }

    _breathingController.duration = Duration(seconds: duration);
    _breathingController.reset();
    _breathingController.forward();
  }

  void _nextPhase() {
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
      appBar: AppBar(
        title: const Text("Breathing Exercise"),
        backgroundColor: const Color.fromARGB(13, 217, 195, 255),
      ),
      body: Column(
        children: [
          // Breathing animation section
          Expanded(
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Ripple Animation Layer with OverflowBox to allow overflow
                  AnimatedBuilder(
                    animation: _rippleAnimation,
                    builder: (context, child) {
                      return OverflowBox(
                        maxWidth: double.infinity,
                        maxHeight: double.infinity,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            for (int i = 0; i < 5; i++)
                              Container(
                                width:
                                    _rippleAnimation.value +
                                    (i * _rippleOffsetAnimation.value),
                                height:
                                    _rippleAnimation.value +
                                    (i * _rippleOffsetAnimation.value),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color:
                                        _colorAnimation.value ??
                                        Colors.cyan.withOpacity(0.8),
                                    width: 2,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: _colorAnimation.value!.withOpacity(
                                        0.1,
                                      ),
                                      spreadRadius: 2,
                                      blurRadius: 1,
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                  // Main Circle with Phase Text Inside (No Fill, Border only)
                  AnimatedBuilder(
                    animation: _sizeAnimation,
                    builder: (context, child) {
                      return Container(
                        width: _sizeAnimation.value,
                        height: _sizeAnimation.value,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: _colorAnimation.value ?? Colors.blue,
                            width: 3,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: _colorAnimation.value!.withOpacity(0.7),
                              spreadRadius: 3,
                              blurRadius: 15,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            _currentPhase,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),

          // Time Left at the bottom
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Time Left: ${(_remainingTime ~/ 60).toString().padLeft(2, '0')}:${(_remainingTime % 60).toString().padLeft(2, '0')}",
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
