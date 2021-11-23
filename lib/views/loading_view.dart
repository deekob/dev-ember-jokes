import 'package:devember_jokes/services/joke_repository.dart';
import 'package:flutter/material.dart';

class JokeLoad extends StatelessWidget {
  void loadingTime(BuildContext context) async {
    await Future.delayed(Duration(seconds: 5));
    var jokeApi = JokeRepository();
    await jokeApi.getJoke('Programming');
    Navigator.pushReplacementNamed(context, '/home', arguments: jokeApi);
  }

  @override
  Widget build(BuildContext context) {
    loadingTime(context);
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/in-a-box.jpg'), fit: BoxFit.fill)),
      ),
    );
  }
}
