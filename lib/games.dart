import 'package:flutter/material.dart';

class Game {
  int index;
  String name;
  String image;

  Game(this.index, this.name, this.image);
}

class GamesScreen extends StatelessWidget {
  GamesScreen({super.key});

  final List<Game> gamesList = [
    Game(0, "Tic Tac Toe", "assets/tic-tac-toe.jpg"),
    Game(0, "Chain Reaction", "assets/game2.jpg"),
    Game(0, "Tic Tac Toe", "assets/tic-tac-toe.jpg"),
    Game(0, "Tic Tac Toe", "assets/tic-tac-toe.jpg"),
    Game(0, "Tic Tac Toe", "assets/tic-tac-toe.jpg"),
    Game(0, "Tic Tac Toe", "assets/tic-tac-toe.jpg"),
    Game(0, "Tic Tac Toe", "assets/tic-tac-toe.jpg"),
    Game(0, "Tic Tac Toe", "assets/tic-tac-toe.jpg"),
    Game(0, "Tic Tac Toe", "assets/tic-tac-toe.jpg"),
    Game(0, "Tic Tac Toe", "assets/tic-tac-toe.jpg"),
    Game(0, "Tic Tac Toe", "assets/tic-tac-toe.jpg"),
    Game(0, "Tic Tac Toe", "assets/tic-tac-toe.jpg"),
    Game(0, "Tic Tac Toe", "assets/tic-tac-toe.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.cyan,
            title: const Center(
                child: Text(
              'Games',
            )),
          ),
          body: ListView.builder(
            itemCount: gamesList.length,
            itemBuilder: (context, index) {
              Game currentGame = gamesList[index];
              return Container(
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
                        image: AssetImage(currentGame.image),
                        opacity: 0.5,
                        fit: BoxFit.fitWidth)),
                child: ListTile(
                    title: Text(
                  currentGame.name,
                  style: const TextStyle(
                      fontSize: 32, fontStyle: FontStyle.italic),
                )),
              );
            },
          ),
        ));
  }
}
