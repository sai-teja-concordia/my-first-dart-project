// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:my_first_dart_project/ChainReaction.dart';
import 'package:my_first_dart_project/TicTacToe.dart';

class Game {
  int index;
  String name;
  String image;
  String route;

  Game(this.index, this.name, this.image, this.route);
}

class GamesScreen extends StatelessWidget {
  GamesScreen({super.key});

  final List<Game> gamesList = [
    Game(0, "Tic Tac Toe", "assets/tic-tac-toe.jpg", "/tictactoe"),
    Game(0, "Chain Reaction", "assets/game2.jpg", "/chainreaction"),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/',
        routes: {
          '/tictactoe': (context) => const TicTacToe(),
          '/chainreaction': (context) => const ChainReaction()
        },
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            backgroundColor: Colors.cyan,
            title: const Center(
                child: Text(
              'Games',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
          ),
          body: ListView.builder(
            itemCount: gamesList.length,
            itemBuilder: (context, index) {
              Game currentGame = gamesList[index];
              return InkWell(
                child: Hero(
                  tag: currentGame.image,
                  child: Container(
                    height: 250,
                    decoration: BoxDecoration(
                      border: const Border(
                          bottom: BorderSide(
                              color: Colors.cyan,
                              width: 1,
                              style: BorderStyle.solid),
                          top: BorderSide(
                              color: Colors.cyan,
                              width: 1,
                              style: BorderStyle.solid)),
                      image: DecorationImage(
                          alignment: Alignment.topRight,
                          image: AssetImage(currentGame.image),
                          opacity: 0.4,
                          fit: BoxFit.fitHeight),
                    ),
                    child: ListTile(
                        title: Text(
                      currentGame.name,
                      style: const TextStyle(
                          fontSize: 32, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
                onTap: () {
                  // print("Tapped on container");
                  Navigator.pushNamed(context, currentGame.route);
                },
              );
            },
          ),
        ));
  }
}
