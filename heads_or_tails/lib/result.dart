import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  String value;
  Result(this.value, {Key? key}) : super(key: key);

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    final _result = widget.value;

    return Scaffold(
      backgroundColor: const Color(0xff61bd86),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Image.asset('images/moeda_$_result.png'),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Image.asset('images/botao_voltar.png'),
          ),
        ],
      ),
    );
  }
}
