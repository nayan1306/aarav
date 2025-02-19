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
    return ClipRRect(
      borderRadius: BorderRadius.circular(16), // Rounded corners
      child: Stack(
        children: [
          // Background Image
          Container(
            height: 150,
            width: 200,
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
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), // Blur effect
              child: Container(
                color: Colors.black.withOpacity(0.3), // Dark overlay
              ),
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
            left: 16,
            bottom: 16,
            right: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 12,
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

// breathing normal tile
class BreathingTile extends StatelessWidget {
  final String assetImagePath;
  final String title;
  final VoidCallback onTap; // Added onTap callback for redirection

  const BreathingTile({
    super.key,
    required this.assetImagePath,
    required this.title,
    required this.onTap, // Required for onTap redirection
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 120, // Increased height to fit title
      child: GestureDetector(
        onTap: onTap, // Redirects to the page on tap
        child: Column(
          children: [
            Card(
              color: const Color.fromARGB(255, 66, 66, 66),
              elevation: 5, // Adding elevation for card-like effect
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16), // Rounded corners
              ),
              child: Container(
                height: 80, // Height of the image section
                width: 100, // Set width of the image
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(assetImagePath), // Using Asset Image
                    fit: BoxFit.contain,
                  ),
                  borderRadius: BorderRadius.circular(
                    12,
                  ), // Rounded corners for image
                ),
              ),
            ),
            // Title outside the card, above the image
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color.fromARGB(255, 216, 216, 216),
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// breathing animated tile
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
    return SizedBox(
      width: 100,
      height: 130,
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
              child: Hero(
                tag: title, // Unique tag for the Hero animation
                child: Container(
                  height: 80,
                  width: 100,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(assetImagePath),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color.fromARGB(255, 216, 216, 216),
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
