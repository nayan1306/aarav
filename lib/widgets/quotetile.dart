import 'package:flutter/material.dart';

class QuoteTile extends StatelessWidget {
  final String assetImagePath;
  final String title;
  final VoidCallback onTap; // Added onTap callback for redirection

  const QuoteTile({
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
