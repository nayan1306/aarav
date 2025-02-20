import 'package:flutter/material.dart';
import 'package:circular_menu/circular_menu.dart';

class MoodTrackerQuickAccessButton extends StatefulWidget {
  const MoodTrackerQuickAccessButton({super.key});

  @override
  _MoodTrackerQuickAccessButtonState createState() =>
      _MoodTrackerQuickAccessButtonState();
}

class _MoodTrackerQuickAccessButtonState
    extends State<MoodTrackerQuickAccessButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _glowController;
  late Animation<double> _glowAnimation;
  final GlobalKey<CircularMenuState> _menuKey =
      GlobalKey<CircularMenuState>(); // 🔹 Control the menu
  bool isMenuOpen = false;

  @override
  void initState() {
    super.initState();

    // 🔵 Glow Animation (Breathing Effect)
    _glowController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _glowAnimation = Tween<double>(begin: 3.0, end: 15.0).animate(
      CurvedAnimation(parent: _glowController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _glowController.dispose();
    super.dispose();
  }

  void _showMoodSelected(String mood) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("$mood Mood Selected"),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _toggleMenu() {
    final menuState = _menuKey.currentState;
    if (menuState != null) {
      if (isMenuOpen) {
        menuState.reverseAnimation(); // Close the menu
      } else {
        menuState.forwardAnimation(); // Open the menu
      }
      setState(() {
        isMenuOpen = !isMenuOpen; // Toggle state
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        // CircularMenu (Icons Expanding to Left)
        CircularMenu(
          key: _menuKey, // 🔹 Allows us to open/close programmatically
          alignment: Alignment(1, 0.3),
          radius: 140,
          animationDuration: const Duration(milliseconds: 400),
          curve: Curves.easeIn, // Smooth ease-in animation when opening
          reverseCurve: Curves.easeInOut, // Ease-in-out animation when closing
          // Define the angles for leftward opening
          startingAngleInRadian: 3.14 / 2.15, // Start at 90° (Top)
          endingAngleInRadian: 3.1 * 3.14 / 2, // End at 270° (Top-left)
          // Hide default circular button
          toggleButtonColor: Colors.transparent,
          toggleButtonSize: 0,

          items: [
            // ✅ Negative Emotions
            CircularMenuItem(
              padding: 0,
              iconSize: 40,
              imagePath: "assets/images/mood_tracker/angry.png",
              color: Colors.transparent,
              onTap: () => _showMoodSelected("Angry"),
            ),

            CircularMenuItem(
              padding: 0,
              iconSize: 45,
              imagePath: "assets/images/mood_tracker/sad.png",
              color: Colors.transparent,
              onTap: () => _showMoodSelected("Sad"),
            ),

            CircularMenuItem(
              padding: 0,
              iconSize: 60,
              imagePath: "assets/images/mood_tracker/annoyed.png",
              color: Colors.transparent,
              onTap: () => _showMoodSelected("Annoyed"),
            ),

            // ✅ Neutral Emotion
            CircularMenuItem(
              padding: 0,
              iconSize: 50,
              imagePath: "assets/images/mood_tracker/tired.png",
              color: Colors.transparent,
              onTap: () => _showMoodSelected("Tired"),
            ),

            // ✅ Positive Emotions
            CircularMenuItem(
              padding: 0,
              iconSize: 50,
              imagePath: "assets/images/mood_tracker/average.png",
              color: Colors.transparent,
              onTap: () => _showMoodSelected("Average"),
            ),

            CircularMenuItem(
              padding: 0,
              iconSize: 65,
              imagePath: "assets/images/mood_tracker/good.png",
              color: Colors.transparent,
              onTap: () => _showMoodSelected("Good"),
            ),

            CircularMenuItem(
              padding: 0,
              iconSize: 68,
              imagePath: "assets/images/mood_tracker/happy.png",
              color: Colors.transparent, // Light yellow-orange
              onTap: () => _showMoodSelected("Happy"),
            ),

            CircularMenuItem(
              padding: 0,
              iconSize: 70,
              imagePath: "assets/images/mood_tracker/loving.png",
              color: Colors.transparent, // Light pink
              onTap: () => _showMoodSelected("Loving"),
            ),
          ],
        ),

        // ✅ Custom Square Toggle Button
        Positioned(
          right: 0,
          top: 490,
          child: GestureDetector(
            onTap: _toggleMenu, // 🔹 Manually toggle menu
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: const Color.fromARGB(161, 22, 21, 21), // Button color
                borderRadius: BorderRadius.circular(
                  8,
                ), // Square with rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.8), // Glow effect
                    blurRadius: _glowAnimation.value,
                    spreadRadius: _glowAnimation.value / 2,
                  ),
                ],
              ),
              child: Icon(
                isMenuOpen ? Icons.close : Icons.tag_faces_sharp, // Toggle icon
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
