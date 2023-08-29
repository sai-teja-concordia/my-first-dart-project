import 'package:flutter/material.dart';
import 'package:my_first_dart_project/ProfileScreen.dart';
import 'package:my_first_dart_project/TicTacToe.dart';
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
        // ignore: avoid_print
        print("widget 1 selected");
        widget = const HomeScreen();
        break;
      case 1:
        widget = GamesScreen();
        break;
      case 2:
        widget = const ProfileState();
        break;
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: widget,
        bottomNavigationBar: BottomNavigationBar(
          enableFeedback: true,
          selectedFontSize: 10,
          currentIndex: currentPageIndex,
          items: const [
            BottomNavigationBarItem(
                label: '',
                icon: Icon(color: Colors.black, size: 45, Icons.home_outlined),
                activeIcon: Icon(color: Colors.cyan, size: 45, Icons.home) ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(color: Colors.black, size: 45, Icons.videogame_asset_outlined),
              activeIcon: Icon(color: Colors.cyan, size: 45, Icons.videogame_asset),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(color: Colors.black, size: 45, Icons.person_2_outlined),
              activeIcon: Icon(color: Colors.cyan, size: 45, Icons.person_2),
            ),
          ],
          onTap: (int tappedIndex) {
            setState(() {
              currentPageIndex = tappedIndex;
            });
          },
        ),
      ),
    );
  }
}
