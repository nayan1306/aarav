import 'package:flutter/material.dart';

class QuoteTile extends StatelessWidget {
  final String assetImagePath;
  final String title;
  final VoidCallback onTap; // Callback for navigation

  const QuoteTile({
    super.key,
    required this.assetImagePath,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final baseSize = screenSize.shortestSide * 0.28;
    final tileWidth = baseSize;
    final tileHeight = baseSize * 1.4;
    final imageHeight = baseSize * 0.7;
    final borderRadius = tileWidth * 0.15;
    final fontSize = tileWidth * 0.13;

    return SizedBox(
      width: tileWidth,
      height: tileHeight,
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min, // Prevent overflow
          children: [
            Card(
              color: const Color.fromARGB(0, 66, 66, 66),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              child: Container(
                height: imageHeight,
                width: tileWidth,
                padding: EdgeInsets.all(tileWidth * 0.08),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(assetImagePath),
                    fit: BoxFit.contain,
                  ),
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
            ),
            SizedBox(height: tileHeight * 0.05),
            Expanded(
              // Prevent text overflow
              child: Text(
                title,
                textAlign: TextAlign.center,
                maxLines: 3,
                overflow: TextOverflow.ellipsis, // Avoid overflow
                style: TextStyle(
                  color: const Color.fromARGB(255, 216, 216, 216),
                  fontSize: fontSize,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
