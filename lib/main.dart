import 'package:flutter/material.dart';
import 'package:fluttoon/assignment7/dairy.dart';

void main() {
  runApp(const Fluttoon());
}

class Fluttoon extends StatelessWidget {
  const Fluttoon({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fluttoon',
      debugShowCheckedModeBanner: false,
      home: Dairy(),
    );
  }
}
