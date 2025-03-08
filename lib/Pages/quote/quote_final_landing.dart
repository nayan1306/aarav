import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'quotes_collection.dart';

class QuoteFinalLanding extends StatefulWidget {
  final String quote;
  final String imagePath;
  final bool isActive;

  const QuoteFinalLanding({
    super.key,
    required this.quote,
    required this.imagePath,
    required this.isActive,
  });

  @override
  _QuoteFinalLandingState createState() => _QuoteFinalLandingState();
}

class _QuoteFinalLandingState extends State<QuoteFinalLanding>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> bgOpacity;
  late Animation<double> bgScale;
  late Animation<double> textOpacity;
  late Animation<double> textTranslate;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    // Background appears quickly (after a delay) with fade & scale.
    bgOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 0.7, curve: Curves.easeOut),
      ),
    );
    bgScale = Tween<double>(begin: 1.1, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 0.7, curve: Curves.easeOut),
      ),
    );

    // Quote text appears with a slight extra delay.
    textOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 1.0, curve: Curves.easeOut),
      ),
    );
    textTranslate = Tween<double>(begin: 50, end: 0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 1.0, curve: Curves.easeOut),
      ),
    );

    if (widget.isActive) {
      _startAnimation();
    }
  }

  void _startAnimation() {
    // Reset and then start the animations with a delay.
    _controller.reset();
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted && widget.isActive) {
        _controller.forward();
      }
    });
  }

  @override
  void didUpdateWidget(covariant QuoteFinalLanding oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isActive && !oldWidget.isActive) {
      // When the page becomes active (either swiped up or down), start the animation.
      _startAnimation();
    } else if (!widget.isActive && oldWidget.isActive) {
      // When the page loses active status, reset immediately.
      _controller.reset();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Background image with fade and scale animation.
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.scale(
              scale: bgScale.value,
              child: Opacity(
                opacity: bgOpacity.value,
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Image.asset(widget.imagePath, fit: BoxFit.cover),
                ),
              ),
            );
          },
        ),
        // Quote text with delayed fade & translate animation.
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Opacity(
              opacity: textOpacity.value,
              child: Transform.translate(
                offset: Offset(0, textTranslate.value),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      widget.quote,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            blurRadius: 8,
                            color: Colors.black87,
                            offset: Offset(3, 3),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
