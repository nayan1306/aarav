import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:math';

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
              double page = _pageController.page ?? 0;
              double distance = (index - page).clamp(-1.0, 1.0);

              // Background Parallax Effect
              double backgroundOffset = distance * 50;

              // Current page moves up & shrinks
              double translateY = distance * -150;
              double scaleCurrent = 1 - (distance * 0.1);
              double opacityCurrent = (1 - distance * 0.7).clamp(0.0, 1.0);

              // Next page appears from behind, growing into view
              double translateYNext = (1 - distance) * 150;
              double scaleNext = 0.9 + (distance * 0.1);
              double opacityNext = distance.clamp(0.0, 1.0);

              return Stack(
                fit: StackFit.expand,
                children: [
                  // Background with subtle parallax
                  Transform.translate(
                    offset: Offset(0, backgroundOffset),
                    child: ImageFiltered(
                      imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Image.asset(
                        widget.imagePaths[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // Next Page (Emerging from Behind)
                  Opacity(
                    opacity: opacityNext,
                    child: Transform.translate(
                      offset: Offset(0, translateYNext),
                      child: Transform.scale(
                        scale: scaleNext,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            child: Text(
                              index + 1 < widget.quotes.length
                                  ? widget.quotes[index + 1]
                                  : "",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.white.withOpacity(0.8),
                                shadows: [
                                  Shadow(
                                    blurRadius: 6,
                                    color: Colors.black54,
                                    offset: Offset(3, 3),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Current Page (Moving Up & Shrinking)
                  Opacity(
                    opacity: opacityCurrent,
                    child: Transform.translate(
                      offset: Offset(0, translateY),
                      child: Transform.scale(
                        scale: scaleCurrent,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            child: Text(
                              widget.quotes[index],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                    blurRadius: 6,
                                    color: Colors.black54,
                                    offset: Offset(3, 3),
                                  ),
                                ],
                              ),
                            ),
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
