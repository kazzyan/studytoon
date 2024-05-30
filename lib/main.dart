import 'package:flutter/material.dart';
import 'package:fluttoon/assignment9/pomodoro.dart';

void main() {
  runApp(const Fluttoon());
}

class Fluttoon extends StatelessWidget {
  const Fluttoon({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Fluttoon',
      debugShowCheckedModeBanner: false,
      home: Pomodoro(),
    );
  }
}
