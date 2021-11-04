import 'package:flutter/material.dart';
import 'dart:math';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  var _appChoiceImage = AssetImage('images/default.png');
  var _message = '';

  void _onSelectChoice(String userChoice) {
    var optionsArr = ['rock', 'paper', 'scissors'];
    var randomNumber = Random().nextInt(3);
    var appChoice = optionsArr[randomNumber];

    setState(() {
      _appChoiceImage = AssetImage('images/$appChoice.png');
    });

    if (
      (userChoice == 'rock' && appChoice == 'scissors')
      || (userChoice == 'scissors' && appChoice == 'paper')
      || (userChoice == 'paper' && appChoice == 'rock')
    ) {
      setState(() {
        _message = 'Você GANHOU! :D';
      });
    } else if (
      appChoice == userChoice
    ) {
      setState(() {
        _message = 'EMPATE!';
      });
    } else {
      setState(() {
        _message = 'Você PERDEU! :(';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JokenPo'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              'Escolha uma opção',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _onSelectChoice('rock'),
                child: Image.asset('images/rock.png', height: 100),
              ),
              GestureDetector(
                onTap: () => _onSelectChoice('scissors'),
                child: Image.asset('images/scissors.png', height: 100),
              ),
              GestureDetector(
                onTap: () => _onSelectChoice('paper'),
                child: Image.asset('images/paper.png', height: 100),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              'Escolha do adversário (APP)',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Image(image: _appChoiceImage,),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              _message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
