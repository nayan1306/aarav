import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:aarav/widgets/moodtrackerquickaccessbutton.dart';

class TrackerPlaceholderPage extends StatefulWidget {
  const TrackerPlaceholderPage({super.key});

  @override
  State<TrackerPlaceholderPage> createState() => _TrackerPlaceholderPageState();
}

class _TrackerPlaceholderPageState extends State<TrackerPlaceholderPage>
    with SingleTickerProviderStateMixin {
  bool _isTracking = false;
  late AnimationController _cardScaleController;
  late Animation<double> _cardScale;

  @override
  void initState() {
    super.initState();

    _cardScaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _cardScale = CurvedAnimation(
      parent: _cardScaleController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _cardScaleController.dispose();
    super.dispose();
  }

  void _onFabPressed() {
    setState(() {
      _isTracking = !_isTracking;
      if (_isTracking) {
        _cardScaleController.forward();
      } else {
        _cardScaleController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: GestureDetector(
          onTap: _onFabPressed,
          child: MoodTrackerQuickAccessButton(),
        ),
      ),
      appBar: AppBar(
        title: const Text(
          "Mood Tracker",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: BackButton(color: Colors.white38),
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          // Enhanced background with a gradient.
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(139, 0, 0, 0),
                  const Color.fromARGB(153, 60, 60, 60),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          // Background blur overlay when tracking is active.
          if (_isTracking)
            AnimatedOpacity(
              opacity: _isTracking ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                child: Container(color: Colors.black.withOpacity(0.2)),
              ),
            ),
          // Centered glassmorphic card with scale animation.
          Center(
            child: ScaleTransition(
              scale: _cardScale,
              child: GlassmorphicCard(onClose: _onFabPressed),
            ),
          ),
        ],
      ),
    );
  }
}

class GlassmorphicCard extends StatelessWidget {
  final VoidCallback onClose;
  const GlassmorphicCard({super.key, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 300,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withOpacity(0.2)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.sentiment_satisfied_alt,
              size: 80,
              color: Colors.greenAccent,
            ),
            const SizedBox(height: 16),
            const Text(
              "Mood Tracking Activated!",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: onClose,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text("Close"),
            ),
          ],
        ),
      ),
    );
  }
}
