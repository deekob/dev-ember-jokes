import 'package:devember_jokes/views/joke_view.dart';
import 'package:devember_jokes/views/loading_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/loadJoke': (context) => JokeLoad(),
        '/viewJoke': (context) => JokeView(),
      },
    );
  }
}
