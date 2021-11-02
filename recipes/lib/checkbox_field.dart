import 'package:flutter/material.dart';

class CheckboxFields extends StatefulWidget {
  const CheckboxFields({Key? key}) : super(key: key);

  @override
  _CheckboxFieldsState createState() => _CheckboxFieldsState();
}

class _CheckboxFieldsState extends State<CheckboxFields> {
  bool _isCheckedBrazilian = false;
  bool _isCheckedItalian = false;
  bool _isCheckedFrench = false;
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkbox recipe'),
      ),
      body: Column(
        children: <Widget>[
          CheckboxListTile(
            title: const Text('Comida brasileira'),
            subtitle: const Text('A melhor!'),
            activeColor: Colors.green,
            secondary: const Icon(Icons.food_bank),
            value: _isCheckedBrazilian,
            onChanged: (bool? value) {
              if (value != null) {
                setState(() {
                  _isCheckedBrazilian = value;
                });
              }
            },
          ),
          CheckboxListTile(
            title: const Text('Comida italiana'),
            subtitle: const Text('A melhor!'),
            activeColor: Colors.red,
            secondary: const Icon(Icons.food_bank),
            value: _isCheckedItalian,
            onChanged: (bool? value) {
              if (value != null) {
                setState(() {
                  _isCheckedItalian = value;
                });
              }
            },
          ),
          CheckboxListTile(
            title: const Text('Comida francesa'),
            subtitle: const Text('A melhor!'),
            activeColor: Colors.blue[900],
            secondary: const Icon(Icons.food_bank),
            value: _isCheckedFrench,
            onChanged: (bool? value) {
              if (value != null) {
                setState(() {
                  _isCheckedFrench = value;
                });
              }
            },
          ),
          const Text('Simple checkbox'),
          Checkbox(
            value: _isChecked,
            onChanged: (bool? value) {
              if (value != null) {
                setState(() {
                  _isChecked = value;
                });
              }
            },
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text(
              'Salvar',
              style: TextStyle(
                fontSize: 22,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
