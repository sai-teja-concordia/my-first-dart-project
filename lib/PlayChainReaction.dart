import 'package:flutter/material.dart';

class PlayChainReaction extends StatefulWidget {
  const PlayChainReaction({super.key, required this.numberOfPlayers});

  final int numberOfPlayers;

  @override
  State<PlayChainReaction> createState() => PlayChainReactionState();
}

class PlayChainReactionState extends State<PlayChainReaction> {
  static const lightSource = Offset(0.9, -0.9);
  static int currentPlayer = 0;
  static Color firstPlayerColor = Colors.green;
  static Color secondPlayerColor = Colors.red;
  static Color thirdPlayerColor = Colors.yellow;
  static Color fourthPlayerColor = Colors.blue;

  static const int columns = 6;
  static const int rows = 10;

  static List<List<int>> displayGrid = List.empty(growable: true);
  static List<List<int>> numberOfAtoms = List.empty(growable: true);

  static const Color xColor = Color(0xFF1BFF00);
  static const Color oColor = Color(0xFFFF0000);
  static const double markerSize = 40.00;
  int oScore = 0;
  int xScore = 0;
  int filledBoxes = 0;

  @override
  void initState() {
    super.initState();
    displayGrid = List.empty(growable: true);
    numberOfAtoms = List.empty(growable: true);
    for (int i = 0; i < rows; i++) {
      List<int> rowFilled = List.filled(columns, -1);
      displayGrid.add(rowFilled);
      rowFilled = List.filled(columns, 0);
      numberOfAtoms.add(rowFilled);
    }
    oScore = 0;
    xScore = 0;
    filledBoxes = 0;
    currentPlayer = 0;
  }

  Widget buildAtom(Color atomColor) {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: atomColor,
          gradient: RadialGradient(
              center: Alignment(lightSource.dx, lightSource.dy),
              colors: [Colors.white, atomColor])),
    );
  }

  Widget gridView() {
    int gridWidth = displayGrid[0].length;
    int gridHeight = displayGrid.length;
    return Column(children: <Widget>[
      AspectRatio(
        aspectRatio: 0.62,
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
              crossAxisCount: gridWidth,
            ),
            itemBuilder: buildGridItems,
            itemCount: gridWidth * gridHeight,
          ),
        ),
      ),
      Container()
    ]);
  }

  void clearScreen() {
    print("Clearing Screen");
    setState(() {
      for (int i = 0; i < rows; i++) {
        List<int> rowFilled = List.filled(columns, -1);
        displayGrid[i] = rowFilled;
        rowFilled = List.filled(columns, 0);
        numberOfAtoms[i] = rowFilled;
      }
      currentPlayer = 0;
    });
    print(displayGrid);
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
    int gridStateLength = displayGrid[0].length;
    int x, y = 0;
    x = (index / gridStateLength).floor();
    y = (index % gridStateLength);
    // print('x - $x, y - $y');
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
    if (displayGrid[x][y] != -1 && displayGrid[x][y] != currentPlayer) {
      return;
    }
    setState(() {
      displayGrid[x][y] = currentPlayer;
      numberOfAtoms[x][y]++;
      print(widget.numberOfPlayers);
      // numberOfPlayers;
      currentPlayer = (currentPlayer + 1) % (widget.numberOfPlayers);
      // filledBoxes++;
    });
    // checkWinner();
    print('x - $x, y - $y');
    print(displayGrid);
    print(numberOfAtoms);
  }

  Widget buildGridTile(int x, int y) {
    // print ('building $x, $y');
    switch (displayGrid[x][y]) {
      case -1:
        return const Text('');
      case 0:
        return buildAtom(firstPlayerColor);
      case 1:
        return buildAtom(secondPlayerColor);
      case 2:
        return buildAtom(thirdPlayerColor);
      case 3:
        return buildAtom(fourthPlayerColor);
      default:
        return const Text('');
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
    // Widget scoresWidget = Container(
    //   padding: const EdgeInsets.only(left: 30, bottom: 10, top: 10),
    //   child: Row(children: [
    //     Expanded(
    //       child: Column(
    //         children: [
    //           Center(
    //             child: Text(
    //               'X won - $xScore times',
    //               style: const TextStyle(
    //                   color: Colors.cyan, fontWeight: FontWeight.bold),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //     Expanded(
    //       child: Column(
    //         children: [
    //           Center(
    //             child: Text(
    //               'O won - $oScore times',
    //               style: const TextStyle(
    //                   color: Colors.cyan, fontWeight: FontWeight.bold),
    //             ),
    //           )
    //         ],
    //       ),
    //     )
    //   ]),
    // );
    //
    // Widget currentPlayerWidget = Container(
    //   padding: const EdgeInsets.only(left: 30, bottom: 10, top: 10),
    //   child: Row(children: [
    //     Expanded(
    //       child: Column(
    //         children: [
    //           Text(
    //             'Current Player is $currentPlayer',
    //             style: TextStyle(
    //               color: currentPlayer == 'O' ? oColor : xColor,
    //             ),
    //           ),
    //         ],
    //       ),
    //     )
    //   ]),
    // );

    Widget clearScreenWidget = IconButton(
      icon: const Icon(Icons.clear),
      tooltip: 'Clear Screen',
      onPressed: () => clearScreen(),
    );
    //
    // Widget clearScreenWidge = Container(
    //   padding: const EdgeInsets.only(left: 30, bottom: 10, top: 10),
    //   child: ElevatedButton(
    //     onPressed: () => clearScreen(),
    //     style: const ButtonStyle(
    //       backgroundColor: MaterialStatePropertyAll<Color>(Colors.cyan),
    //     ),
    //     child: const Text("Clear Screen"),
    //   ),
    // );
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: const Center(
              child: Text(
            'Chain Reaction',
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
          actions: [clearScreenWidget],
        ),
        body: ListView(
          children: [
            gridView(),
            // currentPlayerWidget,
            // scoresWidget,
            // clearScreenWidget
          ],
        ));
  }
}
