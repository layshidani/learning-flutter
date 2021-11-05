import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _price = '0';

  void _onGetPrice() async {
    var url = Uri.parse('https://blockchain.info/ticker');
    http.Response response = await http.get(url);
    Map<String, dynamic> body = json.decode(response.body);

    setState(() {
      _price = body['BRL']['buy'].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('images/bitcoin.png'),
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 30),
                child: Text(
                  'R\$ $_price',
                  style: const TextStyle(fontSize: 35),
                ),
              ),
              ElevatedButton(
                onPressed: _onGetPrice,
                child: const Text('Atualizar'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  textStyle: const TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
