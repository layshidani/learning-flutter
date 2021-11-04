import 'package:flutter/material.dart';
import 'dart:math';

import 'package:heads_or_tails/result.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void _onShowResult() {
    List optionsArr = ['cara', 'coroa'];
    var randomNumber = Random().nextInt(optionsArr.length);
    var result = optionsArr[randomNumber];
    print(result);

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Result(result)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff61bd86),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Image.asset('images/logo.png'),
          GestureDetector(
            onTap: _onShowResult,
            child: Image.asset('images/botao_jogar.png'),
          ),
        ],
      ),
    );
  }
}
