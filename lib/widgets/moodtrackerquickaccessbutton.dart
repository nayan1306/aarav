import 'package:flutter/material.dart';
import 'package:fab_circular_menu_plus/fab_circular_menu_plus.dart';

class MoodTrackerQuickAccessButton extends StatefulWidget {
  final GlobalKey<FabCircularMenuPlusState> fabKey;

  const MoodTrackerQuickAccessButton({super.key, required this.fabKey});

  @override
  _MoodTrackerQuickAccessButtonState createState() =>
      _MoodTrackerQuickAccessButtonState();
}

class _MoodTrackerQuickAccessButtonState
    extends State<MoodTrackerQuickAccessButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _glowController;
  late Animation<double> _glowAnimation;

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

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _glowAnimation,
      builder: (context, child) {
        return FabCircularMenuPlus(
          key: widget.fabKey,
          alignment: const Alignment(1.20, 0.35),
          ringColor: Colors.white.withAlpha(25),
          ringDiameter: 400.0,
          ringWidth: 100.0,
          fabSize: 56.0,
          fabElevation: 8.0,
          fabColor: Colors.transparent,
          fabMargin: const EdgeInsets.all(16.0),
          animationDuration: const Duration(milliseconds: 500),
          animationCurve: Curves.easeInOutCubicEmphasized,

          // Custom FAB with Breathing Glow Effect
          fabChild: Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(18.0),
              color: const Color.fromARGB(170, 0, 0, 0), // FAB background color
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(
                    255,
                    255,
                    255,
                    255,
                  ).withOpacity(0.8), // Glow color
                  blurRadius: _glowAnimation.value, // Animated glow effect
                  spreadRadius: _glowAnimation.value / 2, // Smooth effect
                ),
              ],
            ),
            child: const Center(child: Icon(Icons.add, color: Colors.white)),
          ),

          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.home, color: Colors.white, size: 30),
              onPressed:
                  () => ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text("Home Pressed"))),
            ),
            IconButton(
              icon: const Icon(Icons.settings, color: Colors.white, size: 30),
              onPressed:
                  () => ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Settings Pressed")),
                  ),
            ),
            IconButton(
              icon: const Icon(Icons.star, color: Colors.white, size: 30),
              onPressed:
                  () => ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text("Star Pressed"))),
            ),
            IconButton(
              icon: const Icon(Icons.info, color: Colors.white, size: 30),
              onPressed:
                  () => ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text("Info Pressed"))),
            ),
          ],
        );
      },
    );
  }
}
