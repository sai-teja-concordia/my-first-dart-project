import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: const Center(
              child: Text(
            'Personal Space',
          )),
        ),
        body: const Center(child: Text("Bonjour Hi.")),
      ),
    );
  }
}
