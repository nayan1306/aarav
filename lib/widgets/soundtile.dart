import 'package:flutter/material.dart';

class SoundTile extends StatelessWidget {
  final String albumArtPath;
  final String title;
  final String soundPath;
  final VoidCallback onTap; // Notify parent on tap

  const SoundTile({
    super.key,
    required this.albumArtPath,
    required this.title,
    required this.soundPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Notify parent on tap
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            color: const Color.fromARGB(255, 66, 66, 66),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Container(
              height: 100,
              width: 140,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(albumArtPath),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(height: 4),
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
    );
  }
}
