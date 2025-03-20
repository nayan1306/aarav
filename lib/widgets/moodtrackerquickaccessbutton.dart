import 'package:aarav/Pages/moodtracker.dart/moodtrackerpage.dart';
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
            //angry mood
            CircularMenuItem(
              padding: 0,
              iconSize: 40,
              imagePath: "assets/images/mood_tracker/angry.png",
              color: Colors.transparent,
              onTap: () {
                _toggleMenu(); // Close the menu first
                Future.delayed(const Duration(milliseconds: 300), () {
                  // Small delay for smooth closing
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 500),
                      pageBuilder:
                          (
                            context,
                            animation,
                            secondaryAnimation,
                          ) => MoodTrackerPage(
                            moodImage: "assets/images/mood_tracker/angry.png",
                            message:
                                "Oh no! You are angry! Take a deep breath and let it go",
                            moodScore: 1,
                          ),
                      transitionsBuilder: (
                        context,
                        animation,
                        secondaryAnimation,
                        child,
                      ) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                    ),
                  );
                });
              },
            ),
            //sad mood
            CircularMenuItem(
              padding: 0,
              iconSize: 40,
              imagePath: "assets/images/mood_tracker/sad.png",
              color: Colors.transparent,
              onTap: () {
                _toggleMenu(); // Close the menu first
                Future.delayed(const Duration(milliseconds: 300), () {
                  // Small delay for smooth closing
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 500),
                      pageBuilder:
                          (
                            context,
                            animation,
                            secondaryAnimation,
                          ) => MoodTrackerPage(
                            moodImage: "assets/images/mood_tracker/sad.png",
                            message:
                                "Oh no! You’re feeling sad! It’s okay to take it slow, you’ve got this!",
                            moodScore: 2,
                          ),
                      transitionsBuilder: (
                        context,
                        animation,
                        secondaryAnimation,
                        child,
                      ) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                    ),
                  );
                });
              },
            ),
            //tired mood
            CircularMenuItem(
              padding: 0,
              iconSize: 40,
              imagePath: "assets/images/mood_tracker/tried.png",
              color: Colors.transparent,
              onTap: () {
                _toggleMenu(); // Close the menu first
                Future.delayed(const Duration(milliseconds: 300), () {
                  // Small delay for smooth closing
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 500),
                      pageBuilder:
                          (context, animation, secondaryAnimation) =>
                              MoodTrackerPage(
                                moodImage:
                                    "assets/images/mood_tracker/tried.png",
                                message: "Oh no! You’re tired! Take a break",
                                moodScore: 3,
                              ),
                      transitionsBuilder: (
                        context,
                        animation,
                        secondaryAnimation,
                        child,
                      ) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                    ),
                  );
                });
              },
            ),
            // average or neutral mood
            CircularMenuItem(
              padding: 0,
              iconSize: 40,
              imagePath: "assets/images/mood_tracker/neutral.png",
              color: Colors.transparent,
              onTap: () {
                _toggleMenu(); // Close the menu first
                Future.delayed(const Duration(milliseconds: 300), () {
                  // Small delay for smooth closing
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 500),
                      pageBuilder:
                          (
                            context,
                            animation,
                            secondaryAnimation,
                          ) => MoodTrackerPage(
                            moodImage: "assets/images/mood_tracker/neutral.png",
                            message:
                                "Just a neutral day? Better moments are ahead!",
                            moodScore: 5,
                          ),
                      transitionsBuilder: (
                        context,
                        animation,
                        secondaryAnimation,
                        child,
                      ) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                    ),
                  );
                });
              },
            ),
            //good mood
            // ✅ Positive Emotions
            CircularMenuItem(
              padding: 0,
              iconSize: 40,
              imagePath: "assets/images/mood_tracker/good.png",
              color: Colors.transparent,
              onTap: () {
                _toggleMenu(); // Close the menu first
                Future.delayed(const Duration(milliseconds: 300), () {
                  // Small delay for smooth closing
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 500),
                      pageBuilder:
                          (
                            context,
                            animation,
                            secondaryAnimation,
                          ) => MoodTrackerPage(
                            moodImage: "assets/images/mood_tracker/good.png",
                            message:
                                "Great! You’re feeling good! Stay positive!",
                            moodScore: 7,
                          ),
                      transitionsBuilder: (
                        context,
                        animation,
                        secondaryAnimation,
                        child,
                      ) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                    ),
                  );
                });
              },
            ),
            //happy mood
            CircularMenuItem(
              padding: 0,
              iconSize: 40,
              imagePath: "assets/images/mood_tracker/happy.png",
              color: Colors.transparent,
              onTap: () {
                _toggleMenu(); // Close the menu first
                Future.delayed(const Duration(milliseconds: 300), () {
                  // Small delay for smooth closing
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 500),
                      pageBuilder:
                          (context, animation, secondaryAnimation) =>
                              MoodTrackerPage(
                                moodImage:
                                    "assets/images/mood_tracker/happy.png",
                                message: "Yay! You're happy! Keep shining!",
                                moodScore: 8,
                              ),
                      transitionsBuilder: (
                        context,
                        animation,
                        secondaryAnimation,
                        child,
                      ) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                    ),
                  );
                });
              },
            ),
            //loving mood
            // TODO:implement the same for all the moods
            CircularMenuItem(
              padding: 0,
              iconSize: 70,
              imagePath: "assets/images/mood_tracker/loving.png",
              color: Colors.transparent,
              onTap: () {
                _toggleMenu();
                Future.delayed(const Duration(milliseconds: 300), () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 500),
                      pageBuilder:
                          (
                            context,
                            animation,
                            secondaryAnimation,
                          ) => MoodTrackerPage(
                            moodImage: "assets/images/mood_tracker/loving.png",
                            message:
                                "Aww! You're feeling loving! ", // 🔹 Pass message
                            moodScore: 10, // 🔹 Pass integer value
                          ),
                      transitionsBuilder: (
                        context,
                        animation,
                        secondaryAnimation,
                        child,
                      ) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                    ),
                  );
                });
              },
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
