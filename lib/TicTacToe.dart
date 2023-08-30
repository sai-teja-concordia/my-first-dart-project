import 'package:flutter/material.dart';
import 'package:my_first_dart_project/PlayTicTacToe.dart';

class TicTacToe extends StatelessWidget {
  const TicTacToe({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> dialogBuilder(BuildContext context) {
      return showDialog<void>(
        // barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Center(child: Text('Tic Tac Toe Rules')),
            content: const Text(
              "1. You play on a 3x3 grid.\n"
              "2. You're X, your friend is O or vice versa.\n"
              "3. Take turns adding your mark to empty squares.\n"
              "4. First to get 3 marks in a row wins (up, down, across, diagonal).\n"
              "5. Game ends with a win or when grid is full.\n"
              "6. If no 3 marks in a row, it's a tie.",
            ),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child:
                    const Text('Close', style: TextStyle(color: Colors.cyan)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    Widget rulesWidget = Container(
      padding: const EdgeInsets.only(left: 30, bottom: 10, top: 30),
      child: Row(children: [
        Expanded(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () => dialogBuilder(context),
                  style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(Colors.cyan),
                  ),
                  child: const Text("Rules"))
            ],
          ),
        )
      ]),
    );

    Widget playWidget = Container(
      padding: const EdgeInsets.only(left: 30, bottom: 10, top: 10),
      child: Row(children: [
        Expanded(
          child: Column(
            children: [
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.cyan),
                ),
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PlayTicTacToe())),
                child: Text("Play"),
              )
            ],
          ),
        )
      ]),
    );

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: const Center(
              child: Text(
            'Tic Tac Toe',
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
        ),
        body: ListView(
          children: [
            Hero(
                tag: 'assets/tic-tac-toe.jpg',
                child: Image.asset(
                  'assets/tic-tac-toe.jpg',
                  width: 370,
                  height: 370,
                  fit: BoxFit.fitHeight,
                )),
            rulesWidget,
            playWidget
          ],
        ));
  }
}
