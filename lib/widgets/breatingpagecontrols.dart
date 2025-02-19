import 'package:flutter/material.dart';

class BreathingIconCard extends StatefulWidget {
  const BreathingIconCard({super.key});

  @override
  _BreathingIconCardState createState() => _BreathingIconCardState();
}

class _BreathingIconCardState extends State<BreathingIconCard> {
  bool isAudioOn = true; // Initial state for Audio (on)
  bool isVibrationOn = false; // Initial state for Vibration (off)
  bool isMusicOn = true; // Initial state for Music (on)
  bool isExitClicked = false; // Initial state for Exit (not clicked)

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(
          color: Color.fromARGB(142, 255, 255, 255),
        ), // White border with no fill
      ),
      color: Colors.transparent, // Set the fill color to transparent
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Audio On/Off Icon
            IconButton(
              icon: Icon(
                isAudioOn
                    ? Icons.volume_up
                    : Icons.volume_off, // Toggle audio icon
              ),
              onPressed: () {
                setState(() {
                  isAudioOn = !isAudioOn; // Toggle the audio state
                });
              },
            ),
            // Vibration On/Off Icon
            IconButton(
              icon: Icon(
                isVibrationOn
                    ? Icons.vibration
                    : Icons.phone_android, // Toggle vibration icon
              ),
              onPressed: () {
                setState(() {
                  isVibrationOn = !isVibrationOn; // Toggle the vibration state
                });
              },
            ),
            // Music On/Off Icon
            IconButton(
              icon: Icon(
                isMusicOn
                    ? Icons.music_note
                    : Icons.music_off, // Toggle music icon
              ),
              onPressed: () {
                setState(() {
                  isMusicOn = !isMusicOn; // Toggle the music state
                });
              },
            ),
            // Exit Button Icon
            IconButton(
              icon: const Icon(
                Icons.exit_to_app,
              ), // Exit button remains the same
              onPressed: () {
                setState(() {
                  isExitClicked = true; // Mark exit button clicked
                });
                // Implement exit functionality here, if necessary
              },
            ),
          ],
        ),
      ),
    );
  }
}
