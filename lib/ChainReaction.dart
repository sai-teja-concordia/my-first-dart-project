import 'package:flutter/material.dart';
import 'package:my_first_dart_project/PlayChainReaction.dart';

class ChainReaction extends StatefulWidget {
  const ChainReaction({super.key});

  @override
  State<ChainReaction> createState() => ChainReactionState();
}

class ChainReactionState extends State<ChainReaction> {
  int numberOfPlayers = 2;

  void changeDropDownValue(int? selectedValue) {
    if (selectedValue is int) {
      setState(() {
        numberOfPlayers = selectedValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget rulesWidget = Container(
      padding: const EdgeInsets.only(left: 30, bottom: 10, top: 30),
      child: Row(children: [
        Expanded(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () => print("Pressed"),
                  style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.cyan),
                      fixedSize: MaterialStatePropertyAll<Size>(Size(70, 30))),
                  child: const Text("Rules"))
            ],
          ),
        )
      ]),
    );

    Widget playerSelector = Container(
      padding: const EdgeInsets.only(left: 30, bottom: 0, top: 0),
      child: Row(children: [
        Expanded(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 10),
                child: DropdownButton(
                  style: const TextStyle(color: Colors.cyan),
                  onChanged: changeDropDownValue,
                  value: numberOfPlayers,
                  iconEnabledColor: Colors.cyan,
                  items: const [
                    DropdownMenuItem(
                      value: 2,
                      child: Text("2 players"),
                    ),
                    DropdownMenuItem(
                      value: 3,
                      child: Text("3 players"),
                    ),
                    DropdownMenuItem(
                      value: 4,
                      child: Text("4 players"),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
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
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(Colors.cyan),
                    fixedSize: MaterialStatePropertyAll<Size>(Size(70, 30))),
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PlayChainReaction(numberOfPlayers: numberOfPlayers))),
                child: const Text("Play"),
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
            'Chain Reaction',
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
        ),
        body: ListView(
          children: [
            Hero(
                tag: 'assets/game2.jpg',
                child: Image.asset(
                  'assets/game2.jpg',
                  width: 370,
                  height: 370,
                  fit: BoxFit.fitHeight,
                )),
            rulesWidget,
            playerSelector,
            playWidget
          ],
        ));
  }
}
