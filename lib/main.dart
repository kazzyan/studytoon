import 'package:flutter/material.dart';
import 'package:fluttoon/movieApp/views/movie_home.dart';

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
      home: MovieHome(),
    );
  }
}
