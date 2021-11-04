import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void _openCompany() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ATM Consultoria'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Center(
                child: Image.asset('images/logo.png'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: _openCompany,
                    child: Image.asset('images/menu_empresa.png'),
                  ),
                  GestureDetector(
                    onTap: _openCompany,
                    child: Image.asset('images/menu_servico.png'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: _openCompany,
                    child: Image.asset('images/menu_cliente.png'),
                  ),
                  GestureDetector(
                    onTap: _openCompany,
                    child: Image.asset('images/menu_contato.png'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
