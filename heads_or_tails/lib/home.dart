import 'package:flutter/material.dart';

import 'package:heads_or_tails/result.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void _openResult() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const ResultPage()));
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
            onTap: _openResult,
            child: Image.asset('images/botao_jogar.png'),
          ),
        ],
      ),
    );
  }
}
