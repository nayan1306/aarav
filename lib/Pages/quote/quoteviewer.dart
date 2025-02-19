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
              double page = _pageController.page ?? 0;
              double distance = (index - page).clamp(-1.0, 1.0);

              // 🎭 Background Parallax & Blur Effect
              double backgroundOffset = distance * 80;
              double blurAmount = (1 - distance.abs()) * 6 + 2;

              // 📜 Current Quote Animation
              double scaleCurrent = 1 - (distance * 0.2);
              double opacityCurrent = (1 - distance.abs()).clamp(0.0, 1.0);
              double translateYCurrent = distance * -80;

              // 🌟 Next Quote Animation (Appearing from Behind)
              double scaleNext = 0.85 + (distance * 0.15);
              double opacityNext = distance.clamp(0.0, 1.0);
              double translateYNext = (1 - distance) * 80;
              double blurNext = (1 - distance) * 8;

              return Stack(
                fit: StackFit.expand,
                children: [
                  // 📸 Background with Parallax & Blur
                  Transform.translate(
                    offset: Offset(0, backgroundOffset),
                    child: ImageFiltered(
                      imageFilter: ImageFilter.blur(
                        sigmaX: blurAmount,
                        sigmaY: blurAmount,
                      ),
                      child: Image.asset(
                        widget.imagePaths[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // 🔮 Next Page (Appearing from Behind)
                  if (index + 1 < widget.quotes.length)
                    Positioned.fill(
                      child: Opacity(
                        opacity: opacityNext,
                        child: Transform.scale(
                          scale: scaleNext,
                          child: Transform.translate(
                            offset: Offset(0, translateYNext),
                            child: ImageFiltered(
                              imageFilter: ImageFilter.blur(
                                sigmaX: blurNext,
                                sigmaY: blurNext,
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0,
                                  ),
                                  child: Text(
                                    widget.quotes[index + 1],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white.withOpacity(0.7),
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
                      ),
                    ),

                  // ✨ Current Quote (Moving Up, Fading & Shrinking)
                  Opacity(
                    opacity: opacityCurrent,
                    child: Transform.scale(
                      scale: scaleCurrent,
                      child: Transform.translate(
                        offset: Offset(0, translateYCurrent),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            child: Text(
                              widget.quotes[index],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 32,
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
