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
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(), // Standard notch
        notchMargin: 6, // Controls notch gap
        color: const Color.fromARGB(121, 0, 0, 0),
        elevation: 3,
        child: Container(
          height: 55,
          width: double.infinity,
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(color: Color.fromARGB(137, 0, 0, 0), width: 1),
            ),
          ),
          child: SalomonBottomBar(
            currentIndex: _currentIndex,
            onTap: (index) => setState(() => _currentIndex = index),
            backgroundColor: const Color.fromARGB(185, 0, 0, 0),
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
                selectedColor: Colors.deepPurpleAccent,
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
