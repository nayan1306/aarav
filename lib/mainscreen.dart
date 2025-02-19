import 'package:flutter/material.dart';
import 'package:aarav/Pages/homepage.dart';
import 'package:aarav/Pages/explorepage.dart';
import 'package:aarav/Pages/timelinepage.dart';
import 'package:aarav/Pages/profilepage.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    ExplorePage(),
    TimelinePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.grey[900]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.1),
              blurRadius: 8,
              spreadRadius: 2,
            ),
          ],
          border: Border(
            top: BorderSide(
              color: Colors.white.withOpacity(0.3), // Border color
              width: 2, // Border thickness
            ),
          ),
        ),
        child: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          backgroundColor: Colors.transparent,
          unselectedItemColor: Colors.grey[400],
          selectedColorOpacity: 0.8,
          items: [
            SalomonBottomBarItem(
              icon: const Icon(Icons.chair_alt_sharp, color: Colors.white),
              title: const Text(
                "Program",
                style: TextStyle(color: Colors.white),
              ),
              selectedColor: Colors.deepPurpleAccent,
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.explore, color: Colors.white),
              title: const Text(
                "Explore",
                style: TextStyle(color: Colors.white),
              ),
              selectedColor: Colors.pinkAccent,
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.timeline, color: Colors.white),
              title: const Text(
                "Timeline",
                style: TextStyle(color: Colors.white),
              ),
              selectedColor: Colors.amberAccent,
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.person, color: Colors.white),
              title: const Text(
                "Profile",
                style: TextStyle(color: Colors.white),
              ),
              selectedColor: Colors.tealAccent,
            ),
          ],
        ),
      ),
    );
  }
}
