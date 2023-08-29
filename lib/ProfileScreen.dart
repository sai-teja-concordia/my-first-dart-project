import 'package:flutter/material.dart';

class ProfileState extends StatelessWidget {
  const ProfileState({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.cyan,
            title: const Center(
                child: Text(
              'Profile',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
          ),
          body: const Center(
              child: Text(
            "You know who you are!!!",
            style: TextStyle(fontSize: 32),
          )),
        ));
  }
}
