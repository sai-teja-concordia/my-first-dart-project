import 'package:flutter/material.dart';

class ChainReaction extends StatelessWidget {
  const ChainReaction({super.key});

  @override
  Widget build(BuildContext context) {
    Widget rulesWidget = Container(
      padding: const EdgeInsets.only(left: 30, bottom: 10, top: 30),
      child: Row(children: [
        Expanded(
          child: Column(
            children: [
              Container(
                child: const Text("Rules"),
              )
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
              Container(
                child: const Text("Coming Soon"),
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
            // Text("Coming Soon")
            // rulesWidget,
            playWidget
          ],
        ));
  }
}
