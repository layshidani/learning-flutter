import 'package:flutter/material.dart';

class TextFields extends StatefulWidget {
  const TextFields({Key? key}) : super(key: key);

  @override
  _TextFieldsState createState() => _TextFieldsState();
}

class _TextFieldsState extends State<TextFields> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Entrada de dados"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(32),
            child: TextField(
              //text, number, emailAddress, datetime
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Digite um valor"),
              //enabled: false,
              //maxLength: 2,
              //maxLengthEnforced: false,
              style: const TextStyle(fontSize: 50, color: Colors.green),
              //obscureText: true,
              /*
              onChanged: (String texto){
                print("valor digitado:" +  texto);
              },*/
              onSubmitted: (String texto) {
                print("valor digitado:" + texto);
              },
              controller: _textEditingController,
            ),
          ),
          ElevatedButton(
            child: const Text("Salvar"),
            onPressed: () {
              print("valor digitado:" + _textEditingController.text);
            },
          )
        ],
      ),
    );
  }
}
