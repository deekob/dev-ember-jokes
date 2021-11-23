import 'package:devember_jokes/services/joke_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class JokeView extends StatefulWidget {
  @override
  _JokeViewState createState() => _JokeViewState();
}

class _JokeViewState extends State<JokeView> {
  late var jokeApi;
  String joke = 'empty joke';
  bool isButtonDisabled = true;

  @override
  void initState() {
    super.initState();
    isButtonDisabled = false;
  }

  @override
  Widget build(BuildContext context) {
    jokeApi = ModalRoute.of(context)!.settings.arguments;
    joke = jokeApi.joke;

    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/in-a-box.jpg'),
                      fit: BoxFit.fill)),
            ),
            Positioned(
              right: 20,
              left: 20,
              bottom: 60,
              child: Column(
                children: <Widget>[
                  customCard("Another Christmas joke"),
                  SizedBox(
                    height: 2,
                  ),
                  customCard(joke),
                  SizedBox(
                    height: 25,
                  ),
                  isButtonDisabled
                      ? SpinKitWave(
                          color: Colors.white,
                          size: 20.0,
                        )
                      : ElevatedButton.icon(
                          onPressed: () async {
                            setState(() {
                              isButtonDisabled = true;
                            });
                            jokeApi = JokeRepository();
                            await jokeApi.getJoke();
                            setState(() {
                              joke = jokeApi.joke;
                              isButtonDisabled = false;
                            });
                          },
                          icon: Icon(Icons.lightbulb),
                          label: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text('Tell me another'),
                          ),
                        )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customCard(String text) {
    return Card(
      color: Colors.white,
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              height: 1.4,
            ),
          )),
    );
  }
}
