import 'package:flutter/material.dart';
import 'package:aarav/Pages/homepage.dart';
import 'package:aarav/Pages/explorepage.dart';
import 'package:aarav/Pages/timelinepage.dart';
import 'package:aarav/Pages/profilepage.dart';
import 'package:fab_circular_menu_plus/fab_circular_menu_plus.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final GlobalKey<FabCircularMenuPlusState> _fabKey = GlobalKey();

  final List<Widget> _pages = [
    HomePage(),
    const ExplorePage(),
    TimelinePage(),
    ProfilePage(),
  ];

  void _toggleMenu() {
    if (_fabKey.currentState?.isOpen ?? false) {
      _fabKey.currentState?.close();
    } else {
      _fabKey.currentState?.open();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBody: true,
      body: _pages[_currentIndex],
      floatingActionButton:
          _currentIndex == 1
              ? FabCircularMenuPlus(
                key: _fabKey,
                alignment: Alignment(0.99, 0),
                ringColor: Colors.white.withAlpha(25),
                ringDiameter: 400.0,
                ringWidth: 100.0,
                fabSize: 56.0,
                fabElevation: 8.0,
                fabColor: Colors.black,
                fabOpenIcon: const Icon(Icons.add, color: Colors.white),
                fabCloseIcon: const Icon(Icons.close, color: Colors.white),
                fabMargin: const EdgeInsets.all(16.0),
                animationDuration: const Duration(milliseconds: 500),
                animationCurve: Curves.easeInOutCirc,
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.home, color: Colors.white, size: 30),
                    onPressed: () => _showSnackBar(context, "Home Pressed"),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.settings,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () => _showSnackBar(context, "Settings Pressed"),
                  ),
                  IconButton(
                    icon: const Icon(Icons.star, color: Colors.white, size: 30),
                    onPressed: () => _showSnackBar(context, "Star Pressed"),
                  ),
                  IconButton(
                    icon: const Icon(Icons.info, color: Colors.white, size: 30),
                    onPressed: () => _showSnackBar(context, "Info Pressed"),
                  ),
                ],
              )
              : null,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 6,
        color: const Color.fromARGB(193, 0, 0, 0),
        elevation: 3,
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
                selectedColor: const Color.fromARGB(114, 0, 0, 0),
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

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(milliseconds: 1000),
      ),
    );
  }
}
