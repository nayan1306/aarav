import 'package:flutter/material.dart';

class BreathingContainerCard extends StatelessWidget {
  final String assetImagePath;
  final String title;
  final String subtitle;
  final Widget nextPage; // Accepts any custom page

  const BreathingContainerCard({
    super.key,
    required this.assetImagePath,
    required this.title,
    required this.subtitle,
    required this.nextPage, // Custom page parameter
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the specified page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => nextPage),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(26), // Rounded corners for the card
        child: Container(
          height: 180,
          width: 150,
          decoration: BoxDecoration(
            color: Colors.grey[900], // Fallback color
            borderRadius: BorderRadius.circular(26), // Ensure rounded corners
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Background Image with Blur Effect
              ClipRRect(
                borderRadius: BorderRadius.circular(26),
                child: Container(color: const Color.fromARGB(111, 69, 69, 69)),
              ),

              // Dark Overlay for better text readability
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(26),
                  color: Colors.black.withOpacity(0.3),
                ),
              ),

              // Gradient Fade for Text Visibility
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(26),
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

              // Content: Image, Title, and Subtitle
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // 🌟 Main Image Above Text
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                        18,
                      ), // Soft rounded corners
                      child: Image.asset(
                        assetImagePath,
                        height: 80,
                        width: 80,
                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(height: 12),

                    // 📝 Title
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 4),

                    // 📌 Subtitle
                    Text(
                      subtitle,
                      textAlign: TextAlign.center,
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
        ),
      ),
    );
  }
}
