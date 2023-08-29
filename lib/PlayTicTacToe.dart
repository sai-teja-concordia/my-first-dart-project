import 'package:flutter/material.dart';

class PlayTicTacToe extends StatefulWidget {
  const PlayTicTacToe({super.key});

  @override
  State<PlayTicTacToe> createState() => PlayTicTacToeState();
}

class PlayTicTacToeState extends State<PlayTicTacToe> {
  static String currentPlayer = 'O';
  // 1st player is O
  List<List<String>> displayGrid = [
    ['', '', ''],
    ['', '', ''],
    ['', '', '']
  ];

  static const Color xColor = Color(0xFF1BFF00);
  static const Color oColor = Color(0xFFFF0000);
  static const double markerSize = 40.00;
  int oScore = 0;
  int xScore = 0;
  int filledBoxes = 0;

  @override
  void initState() {
    super.initState();
    displayGrid = [
      ['', '', ''],
      ['', '', ''],
      ['', '', '']
    ];
    oScore = 0;
    xScore = 0;
    filledBoxes = 0;
  }

  Widget gridView() {
    int gridStateLength = displayGrid.length;
    return Column(children: <Widget>[
      AspectRatio(
        aspectRatio: 1.0,
        child: Container(
          padding: const EdgeInsets.all(10.0),
          margin: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 10,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          // decoration: BoxDecoration(
          //     border: Border.all(color: Colors.black, width: 2.0)),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: gridStateLength,
            ),
            itemBuilder: buildGridItems,
            itemCount: gridStateLength * gridStateLength,
          ),
        ),
      ),
      Container()
    ]);
  }

  void clearScreen() {
    setState(() {
      displayGrid = [
        ['', '', ''],
        ['', '', ''],
        ['', '', '']
      ];
      filledBoxes = 0;
    });
  }

  Future<void> showWinOrDrawDialog(BuildContext context, String dialogText) {
    return showDialog<void>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(child: Text('Game over!!')),
          content: Text(dialogText),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Play Again',
                  style: TextStyle(color: Colors.cyan)),
              onPressed: () {
                clearScreen();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget buildGridItems(BuildContext context, int index) {
    int gridStateLength = displayGrid.length;
    int x, y = 0;
    x = (index / gridStateLength).floor();
    y = (index % gridStateLength);
    return GestureDetector(
      onTap: () => gridTapped(x, y),
      onLongPress: () => print("longPressed"),
      onDoubleTap: () => print("double tap"),
      // onLongPressCancel: () => print("longPress cancelled "),
      // onTapCancel: () => print("tap cancelled"),
      child: GridTile(
        child: Container(
          decoration:
              BoxDecoration(border: Border.all(color: Colors.cyan, width: 0.5)),
          child: Center(
            child: buildGridTile(x, y),
          ),
        ),
      ),
    );
  }

  void gridTapped(int x, int y) {
    if (displayGrid[x][y] != '') {
      return;
    }
    setState(() {
      if (currentPlayer == 'O') {
        displayGrid[x][y] = 'O';
        currentPlayer = 'X';
      } else {
        displayGrid[x][y] = 'X';
        currentPlayer = 'O';
      }
      filledBoxes++;
    });
    checkWinner();
    // print('x - $x, y - $y');
    // print(displayGrid);
  }

  Widget buildGridTile(int x, int y) {
    switch (displayGrid[x][y]) {
      case '':
        return const Text('');
      case 'X':
        return const Text(
          'X',
          style: TextStyle(color: xColor, fontSize: markerSize),
        );
      case 'O':
        return const Text(
          'O',
          style: TextStyle(color: oColor, fontSize: markerSize),
        );
      default:
        return Text(displayGrid[x][y].toString());
    }
  }

  void checkWinner() {
    // Horizontal
    if (displayGrid[0][0] == displayGrid[0][1] &&
        displayGrid[0][0] == displayGrid[0][2] &&
        displayGrid[0][0] != '') {
      showWinnerDialog(displayGrid[0][0]);
    } else if (displayGrid[1][0] == displayGrid[1][1] &&
        displayGrid[1][0] == displayGrid[1][2] &&
        displayGrid[1][0] != '') {
      showWinnerDialog(displayGrid[1][0]);
    } else if (displayGrid[2][0] == displayGrid[2][1] &&
        displayGrid[2][0] == displayGrid[2][2] &&
        displayGrid[2][0] != '') {
      showWinnerDialog(displayGrid[2][0]);
    } // Vertical
    else if (displayGrid[0][0] == displayGrid[1][0] &&
        displayGrid[0][0] == displayGrid[2][0] &&
        displayGrid[0][0] != '') {
      showWinnerDialog(displayGrid[0][0]);
    } else if (displayGrid[0][1] == displayGrid[1][1] &&
        displayGrid[0][1] == displayGrid[2][1] &&
        displayGrid[0][1] != '') {
      showWinnerDialog(displayGrid[0][1]);
    } else if (displayGrid[0][2] == displayGrid[1][2] &&
        displayGrid[0][2] == displayGrid[2][2] &&
        displayGrid[0][2] != '') {
      showWinnerDialog(displayGrid[0][2]);
    } // Diagonal
    else if (displayGrid[0][0] == displayGrid[1][1] &&
        displayGrid[0][0] == displayGrid[2][2] &&
        displayGrid[0][0] != '') {
      showWinnerDialog(displayGrid[0][0]);
    } else if (displayGrid[2][0] == displayGrid[1][1] &&
        displayGrid[2][0] == displayGrid[0][2] &&
        displayGrid[2][0] != '') {
      showWinnerDialog(displayGrid[2][0]);
    } // Draw
    else if (filledBoxes == 9) {
      showWinOrDrawDialog(context, 'The game is a draw');
      return;
    }
  }

  void showWinnerDialog(String winner) {
    if (winner == 'X') {
      xScore++;
    } else if (winner == 'O') {
      oScore++;
    }
    showWinOrDrawDialog(context, '$winner is the winner');
  }

  @override
  Widget build(BuildContext context) {
    Widget scoresWidget = Container(
      padding: const EdgeInsets.only(left: 30, bottom: 10, top: 10),
      child: Row(children: [
        Expanded(
          child: Column(
            children: [
              Center(
                child: Text(
                  'X won - $xScore times',
                  style: const TextStyle(
                      color: Colors.cyan, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Center(
                child: Text(
                  'O won - $oScore times',
                  style: const TextStyle(
                      color: Colors.cyan, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        )
      ]),
    );

    Widget currentPlayerWidget = Container(
      padding: const EdgeInsets.only(left: 30, bottom: 10, top: 10),
      child: Row(children: [
        Expanded(
          child: Column(
            children: [
              Text(
                'Current Player is $currentPlayer',
                style: TextStyle(
                  color: currentPlayer == 'O' ? oColor : xColor,
                ),
              ),
            ],
          ),
        )
      ]),
    );

    Widget clearScreenWidget = Container(
      padding: const EdgeInsets.only(left: 30, bottom: 10, top: 10),
      child: Row(children: [
        Expanded(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () => clearScreen(),
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.cyan),
                ),
                child: const Text("Clear Screen"),
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
            gridView(),
            currentPlayerWidget,
            scoresWidget,
            clearScreenWidget
          ],
        ));
  }
}
