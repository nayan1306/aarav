import 'dart:ui';
import 'package:flutter/material.dart';

class QuotesRecommendedCard extends StatelessWidget {
  final String assetImagePath;
  final String title;
  final String subtitle;

  const QuotesRecommendedCard({
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
