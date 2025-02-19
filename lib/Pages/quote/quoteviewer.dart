import 'dart:ui';
import 'package:flutter/material.dart';

class QuoteViewer extends StatefulWidget {
  final List<String> quotes;
  final List<String> imagePaths;

  const QuoteViewer({
    super.key,
    required this.quotes,
    required this.imagePaths,
  });

  @override
  State<QuoteViewer> createState() => _QuoteViewerState();
}

class _QuoteViewerState extends State<QuoteViewer> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        itemCount: widget.quotes.length,
        itemBuilder: (context, index) {
          return AnimatedBuilder(
            animation: _pageController,
            builder: (context, child) {
              double scale = 1.0;

              if (_pageController.position.haveDimensions) {
                double page = _pageController.page ?? 0;
                double distance = (index - page).abs();
                scale = 1 - (distance * 0.2);
                scale = scale.clamp(0.8, 1.0);
              }

              return Stack(
                fit: StackFit.expand,
                children: [
                  // Blurred background image with zoom effect
                  Transform.scale(
                    scale: scale,
                    child: ImageFiltered(
                      imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Image.asset(
                        widget.imagePaths[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Quote text in the center with zoom effect
                  Center(
                    child: Transform.scale(
                      scale: scale,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          widget.quotes[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                blurRadius: 4,
                                color: Colors.black54,
                                offset: Offset(2, 2),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
