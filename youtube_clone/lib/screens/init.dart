import 'package:flutter/material.dart';

class Init extends StatefulWidget {
  const Init({Key? key}) : super(key: key);

  @override
  _InitState createState() => _InitState();
}

class _InitState extends State<Init> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Início",
        style: TextStyle(fontSize: 25),
      ),
    );
  }
}
