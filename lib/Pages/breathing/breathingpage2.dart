import 'dart:async';
import 'package:aarav/widgets/breatingpagecontrols.dart';
import 'package:flutter/material.dart';

class BreathingPage2 extends StatefulWidget {
  final int totalDuration; // Total session duration in seconds
  final List<int> durations; // Durations for [Inhale, Hold1, Exhale, Hold2]
  const BreathingPage2({
    super.key,
    required this.totalDuration,
    required this.durations,
  });

  @override
  State<BreathingPage2> createState() => _BreathingPage2State();
}

class _BreathingPage2State extends State<BreathingPage2>
    with TickerProviderStateMixin {
  late AnimationController _breathingController;
  late Timer _timer;
  late Timer _countdownTimer;

  int _remainingTime = 0;
  int _countdown = 3; // Countdown timer before session starts
  String _currentPhase = "Inhale";

  late List<Map<String, dynamic>> _breathingPattern;
  int _patternIndex = 0;

  late Animation<double> _sizeAnimation;
  late Animation<double> _rippleAnimation;
  late Animation<double> _rippleOffsetAnimation;

  bool _sessionStarted = false; // Controls when the session starts

  @override
  void initState() {
    super.initState();
    _remainingTime = widget.totalDuration;

    // Define breathing pattern
    _breathingPattern = [
      {"phase": "Inhale", "duration": widget.durations[0]},
      {"phase": "Hold", "duration": widget.durations[1]},
      {"phase": "Exhale", "duration": widget.durations[2]},
      {"phase": "Hold", "duration": widget.durations[3]},
    ];

    // Start countdown before session starts
    _startCountdown();
  }

  void _startCountdown() {
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_countdown > 1) {
        setState(() {
          _countdown--;
        });
      } else {
        _countdownTimer.cancel();
        setState(() {
          _sessionStarted = true; // Start the session after countdown
        });
        _setupAnimation();
        _startTimer();
      }
    });
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
      _breathingController.duration = Duration(seconds: duration);
    });

    if (phase == "Inhale") {
      _sizeAnimation = Tween<double>(
        begin: 100,
        end: 200,
      ).animate(_breathingController);
      _rippleAnimation = Tween<double>(
        begin: 10,
        end: 300,
      ).animate(_breathingController);
      _rippleOffsetAnimation = Tween<double>(
        begin: 0,
        end: 80,
      ).animate(_breathingController);
    } else if (phase == "Hold" && _patternIndex == 1) {
      // Hold after Inhale
      _sizeAnimation = Tween<double>(
        begin: 200,
        end: 200,
      ).animate(_breathingController);
      _rippleAnimation = Tween<double>(
        begin: 300,
        end: 300,
      ).animate(_breathingController);
      _rippleOffsetAnimation = AlwaysStoppedAnimation(80);
    } else if (phase == "Exhale") {
      _sizeAnimation = Tween<double>(
        begin: 200,
        end: 100,
      ).animate(_breathingController);
      _rippleAnimation = Tween<double>(
        begin: 300,
        end: 0,
      ).animate(_breathingController);
      _rippleOffsetAnimation = Tween<double>(
        begin: 80,
        end: 10,
      ).animate(_breathingController);
    } else if (phase == "Hold" && _patternIndex == 3) {
      // Hold after Exhale
      _sizeAnimation = Tween<double>(
        begin: 100,
        end: 100,
      ).animate(_breathingController);
      _rippleAnimation = Tween<double>(
        begin: 0,
        end: 0,
      ).animate(_breathingController);
      _rippleOffsetAnimation = AlwaysStoppedAnimation(10);
    }

    _breathingController.reset();
    _breathingController.forward();
  }

  void _nextPhase() {
    _patternIndex = (_patternIndex + 1) % _breathingPattern.length;
    _updateAnimation();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime >= 0) {
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
    _countdownTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          // Display Countdown before starting session
          if (!_sessionStarted)
            Expanded(
              child: Center(
                child: Text(
                  _countdown > 0 ? "$_countdown" : "Start!",
                  style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          else
            Expanded(
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Ripple Animation Layer
                    AnimatedBuilder(
                      animation: _rippleAnimation,
                      builder: (context, child) {
                        return OverflowBox(
                          maxWidth: double.infinity,
                          maxHeight: double.infinity,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              for (int i = 0; i < 6; i++)
                                Container(
                                  width:
                                      _rippleAnimation.value +
                                      (i * _rippleOffsetAnimation.value),
                                  height:
                                      _rippleAnimation.value +
                                      (i * _rippleOffsetAnimation.value),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: const Color.fromARGB(
                                      255,
                                      187,
                                      212,
                                      255,
                                    ).withOpacity(0.2 - (i * 0.03)),
                                  ),
                                ),
                            ],
                          ),
                        );
                      },
                    ),
                    // Main Circle with Phase Text Inside
                    AnimatedBuilder(
                      animation: _sizeAnimation,
                      builder: (context, child) {
                        return Container(
                          width: _sizeAnimation.value,
                          height: _sizeAnimation.value,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(145, 210, 245, 255),
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

          // Time Left Display
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  "Time Left: ${(_remainingTime ~/ 60).toString().padLeft(2, '0')}:${(_remainingTime % 60).toString().padLeft(2, '0')}",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 167, 167, 167),
                  ),
                ),
                BreathingIconCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
