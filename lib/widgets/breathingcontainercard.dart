import 'package:flutter/material.dart';

class BreathingContainerCard extends StatelessWidget {
  final String assetImagePath;
  final String title;
  final String subtitle;
  final Widget nextPage;

  const BreathingContainerCard({
    super.key,
    required this.assetImagePath,
    required this.title,
    required this.subtitle,
    required this.nextPage,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    // Maintain proportional scaling using shortestSide
    final baseSize = screenSize.shortestSide * 0.42;
    final tileWidth = baseSize;
    final tileHeight = baseSize * 1.2;
    final borderRadius = tileWidth * 0.17;
    final imageSize = tileWidth * 0.4;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => nextPage),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Container(
          height: tileHeight,
          width: tileWidth,
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(borderRadius),
                child: Container(color: const Color.fromARGB(111, 69, 69, 69)),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius),
                  color: Colors.black.withOpacity(0.3),
                ),
              ),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(borderRadius),
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.7),
                        Colors.transparent,
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(tileWidth * 0.07),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(tileWidth * 0.12),
                      child: Image.asset(
                        assetImagePath,
                        height: imageSize,
                        width: imageSize,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: tileHeight * 0.05),
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: tileWidth * 0.10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: tileHeight * 0.03),
                    Text(
                      subtitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: tileWidth * 0.08,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
