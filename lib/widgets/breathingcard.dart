import 'dart:ui';
import 'package:flutter/material.dart';

class BreathingRecommendedCard extends StatelessWidget {
  final String assetImagePath;
  final String title;
  final String subtitle;

  const BreathingRecommendedCard({
    super.key,
    required this.assetImagePath,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    // Retrieve screen size via MediaQuery
    final screenSize = MediaQuery.of(context).size;
    // Define card dimensions as fractions of the screen size
    final cardWidth = screenSize.width * 0.45;
    final cardHeight = screenSize.height * 0.25;

    return ClipRRect(
      borderRadius: BorderRadius.circular(16), // Rounded corners
      child: Stack(
        children: [
          // Background Image
          Container(
            height: cardHeight,
            width: cardWidth,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(assetImagePath), // Using Asset Image
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Blur Effect Overlay
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(color: Colors.black.withOpacity(0.3)),
            ),
          ),
          // Gradient Overlay (for text visibility)
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black.withOpacity(0.7), Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ),
          // Text Content
          Positioned(
            left: cardWidth * 0.08,
            bottom: cardHeight * 0.1,
            right: cardWidth * 0.08,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: cardWidth * 0.08, // Dynamic font size
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: cardHeight * 0.02),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: cardWidth * 0.05,
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

class BreathingTile extends StatelessWidget {
  final String assetImagePath;
  final String title;
  final VoidCallback onTap; // onTap callback for redirection

  const BreathingTile({
    super.key,
    required this.assetImagePath,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Get screen size
    final screenSize = MediaQuery.of(context).size;
    // Define tile dimensions relative to screen size
    final tileWidth = screenSize.width * 0.25;
    final tileHeight = screenSize.height * 0.2;
    // Define image height as a fraction of the tile height
    final imageHeight = tileHeight * 0.65;

    return SizedBox(
      width: tileWidth,
      height: tileHeight,
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Card(
              color: const Color.fromARGB(255, 66, 66, 66),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Container(
                height: imageHeight,
                width: tileWidth,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(assetImagePath), // Using Asset Image
                    fit: BoxFit.contain,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: tileHeight * 0.05),
            // Title below the card
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color.fromARGB(255, 216, 216, 216),
                fontSize: tileWidth * 0.14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BreathingTileAnimated extends StatelessWidget {
  final String assetImagePath;
  final String title;
  final VoidCallback onTap;

  const BreathingTileAnimated({
    super.key,
    required this.assetImagePath,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    // Use the shortest side to maintain a proportional tile shape
    final baseSize = screenSize.shortestSide * 0.25;
    final tileWidth = baseSize;
    final tileHeight = baseSize * 1.1; // Maintain aspect ratio
    final imageSize = tileWidth * 0.7;

    return Container(
      color: const Color.fromARGB(0, 255, 255, 255),
      width: tileWidth,
      height: tileHeight,
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              color: Colors.transparent,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Hero(
                tag: title,
                child: Container(
                  height: imageSize,
                  width: imageSize,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(assetImagePath),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            SizedBox(height: tileHeight * 0.05),
            SizedBox(
              width: tileWidth * 0.9,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color.fromARGB(255, 216, 216, 216),
                    fontSize: tileWidth * 0.14,
                    fontWeight: FontWeight.bold,
                  ),
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
