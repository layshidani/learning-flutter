import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _etanolController = TextEditingController();
  final TextEditingController _gasController = TextEditingController();
  String _result = '';

  void onCalc() {
    double? etanolPrice = double.tryParse(_etanolController.text);
    double? gasPrice = double.tryParse(_gasController.text);

    if (etanolPrice == null || gasPrice == null) {
      setState(() {
        _result =
            'Valor inválido. Digite um número maior do que 0 e use ponto (.) ao invés da vírgula (,)';
      });
    } else {
      final _factorResult = (etanolPrice / gasPrice) >= 0.7;
      if (_factorResult) {
        setState(() {
          _result = 'Abasteça com GASOLINA.';
        });
      } else {
        setState(() {
          _result = 'Abasteça com ETANOL.';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Qual combustível compensa mais?')),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: Image.asset('images/logo.png'),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  'Saiba qual a melhor opção para abastecimento do seu carro',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: 'Preço do etanol. ex: 3.99'),
                style: const TextStyle(
                  fontSize: 22,
                ),
                controller: _etanolController,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: 'Preço da gasolina. ex: 5.99'),
                style: const TextStyle(
                  fontSize: 22,
                ),
                controller: _gasController,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: ElevatedButton(
                  child: const Text(
                    'Calcular',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  onPressed: () {
                    onCalc();
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  'Resultado: ',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  _result,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[900],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
