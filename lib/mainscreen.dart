import 'package:aarav/widgets/moodtrackerquickaccessbutton.dart';
import 'package:flutter/material.dart';
import 'package:aarav/Pages/homepage.dart';
import 'package:aarav/Pages/explorepage.dart';
import 'package:aarav/Pages/timelinepage.dart';
import 'package:aarav/Pages/profilepage.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MainScreen extends StatefulWidget {
  final int initialIndex;

  const MainScreen({
    super.key,
    this.initialIndex = 0,
  }); // Default to 0 (HomePage)

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int _currentIndex;

  final List<Widget> _pages = [
    HomePage(),
    const ExplorePage(),
    TimelinePage(),
    ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex; // Use the passed index
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBody: true,
      body: _pages[_currentIndex],
      floatingActionButton:
          _currentIndex == 1 ? MoodTrackerQuickAccessButton() : null,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        color: Colors.black,
        elevation: 5,
        child: SizedBox(
          height: 55,
          width: double.infinity,
          child: SalomonBottomBar(
            currentIndex: _currentIndex,
            onTap: (index) => setState(() => _currentIndex = index),
            backgroundColor: Colors.transparent,
            unselectedItemColor: Colors.grey[400],
            selectedColorOpacity: 0.8,
            items: [
              SalomonBottomBarItem(
                icon: const Icon(
                  Icons.chair_alt_sharp,
                  color: Colors.white,
                  size: 22,
                ),
                title: const Text(
                  "Program",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                selectedColor: const Color.fromARGB(150, 147, 255, 117),
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.explore, color: Colors.white, size: 22),
                title: const Text(
                  "Explore",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                selectedColor: Colors.pinkAccent,
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.timeline, color: Colors.white, size: 22),
                title: const Text(
                  "Timeline",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                selectedColor: Colors.amberAccent,
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.person, color: Colors.white, size: 22),
                title: const Text(
                  "Profile",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                selectedColor: Colors.tealAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
