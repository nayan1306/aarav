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
    const ExplorePage(),
    TimelinePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBody: true,
      body: _pages[_currentIndex],
      // Show FAB only on the Explore page (index 1)
      floatingActionButton:
          _currentIndex == 1
              ? FloatingActionButton(
                onPressed: () {
                  // Add your functionality here.
                },
                backgroundColor: const Color.fromARGB(151, 0, 0, 0),
                child: const Icon(Icons.add, color: Colors.white),
              )
              : null,
      // Use the custom FAB location to position the FAB above the BottomAppBar
      floatingActionButtonLocation: const CustomFabLocation(
        offsetX: 130,
        offsetY: -60,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 6,
        color: const Color.fromARGB(193, 0, 0, 0),
        elevation: 3,
        child: SizedBox(
          height: 55,
          width: double.infinity,
          // decoration: const BoxDecoration(
          //   border: Border(
          //     top: BorderSide(color: Color.fromARGB(137, 0, 0, 0), width: 1),
          //   ),
          // ),
          child: SalomonBottomBar(
            currentIndex: _currentIndex,
            onTap: (index) => setState(() => _currentIndex = index),
            backgroundColor: const Color.fromARGB(0, 0, 0, 0),
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
}

/// Custom FAB location to shift the FAB by specific offsets.
/// This calculates the centerDocked position and then applies the given offsets.
class CustomFabLocation extends FloatingActionButtonLocation {
  final double offsetX;
  final double offsetY;

  const CustomFabLocation({this.offsetX = 0, this.offsetY = 0});

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    final double fabX =
        (scaffoldGeometry.scaffoldSize.width -
                scaffoldGeometry.floatingActionButtonSize.width) /
            2 +
        offsetX;
    final double fabY =
        scaffoldGeometry.scaffoldSize.height -
        scaffoldGeometry.floatingActionButtonSize.height -
        scaffoldGeometry.minInsets.bottom +
        offsetY;
    return Offset(fabX, fabY);
  }
}
