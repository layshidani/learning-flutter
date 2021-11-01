import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Frase do dia'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _aleatoryNumber = 0;
  List phrases = [
    'Pode se encontrar a felicidade mesmo nas horas mais sombrias, se a pessoa se lembrar de acender a luz. (Harry Potter e o Prisioneiro de Azkaban)',
    'Esperança é a única coisa mais forte que o medo. Um pouco de esperança é eficaz, muita esperança é perigoso. Faíscas são boas enquanto são contidas. (Jogos Vorazes)',
    'Tu te tornas eternamente responsável por aquilo que cativas. (O Pequeno Príncipe)',
  ];

  void _incrementCounter() {
    setState(() {
      _aleatoryNumber = Random().nextInt(3);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Center(
              child: Image(
                image: AssetImage('images/logo.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 30, 10, 20),
              child: Text(
                phrases[_aleatoryNumber],
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.center,
              ),
            ),
            const Text(
              'Pressione o botão para gerar uma frase',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
