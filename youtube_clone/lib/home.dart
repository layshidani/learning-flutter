import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'images/youtube.png',
          width: 98,
          height: 22,
        ),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: const Icon(Icons.videocam)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.account_circle)),
        ],
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.grey,
          opacity: 1,
        ),
      ),
      body: Container(),
    );
  }
}
