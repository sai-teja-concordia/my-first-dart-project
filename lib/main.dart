import 'package:flutter/material.dart';
import 'package:my_first_dart_project/ProfileScreen.dart';
import 'package:my_first_dart_project/games.dart';
import 'package:my_first_dart_project/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget widget = Container(); // default
    switch (currentPageIndex) {
      case 0:
        print("widget 1 selected");
        widget = const HomeScreen();
        break;
      case 1:
        widget = GamesScreen();
        break;
      case 2:
        widget = const ProfileScreen();
        break;
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: widget,
        bottomNavigationBar: NavigationBar(
          selectedIndex: currentPageIndex,
          destinations: const [
            NavigationDestination(
                label: 'Home',
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home)),
            NavigationDestination(
              label: 'Games',
              icon: Icon(Icons.videogame_asset_outlined),
              selectedIcon: Icon(Icons.videogame_asset),
            ),
            NavigationDestination(
              label: 'Profile',
              icon: Icon(Icons.person_2_outlined),
              selectedIcon: Icon(Icons.person_2),
            ),
          ],
          onDestinationSelected: (int tappedIndex) {
            setState(() {
              currentPageIndex = tappedIndex;
            });
          },
        ),
      ),
    );
  }
}
