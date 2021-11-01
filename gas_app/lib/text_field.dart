import 'package:flutter/material.dart';

class CustomFieldText extends StatefulWidget {
  const CustomFieldText({Key? key}) : super(key: key);

  @override
  _CustomFieldText createState() => _CustomFieldText();
}

class _CustomFieldText extends State<CustomFieldText> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Etanol ou gasolina?'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(32),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Digite um valor'),
              style: const TextStyle(
                fontSize: 25,
              ),
              controller: _textEditingController,
            ),
          ),
          ElevatedButton(
            child: Text('Salvar'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
