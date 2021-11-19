import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _taskList = [];
  Map<String, dynamic> _lastRemovedTask = {};
  final TextEditingController _controllerTask = TextEditingController();

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/todoList-data.json');
  }

  _saveTask() {
    String inputedTask = _controllerTask.text;

    Map<String, dynamic> task = {};
    task['title'] = inputedTask;
    task['done'] = false;

    setState(() {
      _taskList.add(task);
    });
    _saveData();

    _controllerTask.text = '';
  }

  _saveData() async {
    var file = await _getFile();

    String data = json.encode(_taskList);
    file.writeAsString(data);
  }

  _readData() async {
    try {
      final file = await _getFile();
      return file.readAsString();
    } catch (error) {
      return null;
    }
  }

  @override
  void initState() {
    super.initState();

    _readData().then((data) {
      setState(() {
        _taskList = json.decode(data);
      });
    });
  }

  Widget onCreateTask(context, index) {
    //final item = _taskList[index]['title'];

    return Dismissible(
        key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) {
          _lastRemovedTask = _taskList[index];

          _taskList.removeAt(index);
          _saveData();

          //snackbar
          final snackBar = SnackBar(
            //backgroundColor: Colors.green,
            duration: const Duration(seconds: 5),
            content: const Text('Tarefa removida!'),
            action: SnackBarAction(
                label: 'Desfazer',
                onPressed: () {
                  //Insere novamente item removido na lista
                  setState(() {
                    _taskList.insert(index, _lastRemovedTask);
                  });
                  _saveData();
                }),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        background: Container(
          color: Colors.red,
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const <Widget>[
              Icon(
                Icons.delete,
                color: Colors.white,
              )
            ],
          ),
        ),
        child: CheckboxListTile(
          title: Text(_taskList[index]['title']),
          value: _taskList[index]['done'],
          onChanged: (valorAlterado) {
            setState(() {
              _taskList[index]['done'] = valorAlterado;
            });

            _saveData();
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    //_saveData();
    //print('itens: ' + DateTime.now().millisecondsSinceEpoch.toString() );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de tarefas'),
        backgroundColor: Colors.purple[800],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          backgroundColor: Colors.purple[800],
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Adicionar Tarefa'),
                    content: TextField(
                      controller: _controllerTask,
                      decoration:
                          const InputDecoration(labelText: 'Digite sua tarefa'),
                      onChanged: (text) {},
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('Cancelar'),
                        onPressed: () => Navigator.pop(context),
                      ),
                      TextButton(
                        child: const Text('Salvar'),
                        onPressed: () {
                          //salvar
                          _saveTask();
                          Navigator.pop(context);
                        },
                      )
                    ],
                  );
                });
          }),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                itemCount: _taskList.length, itemBuilder: onCreateTask),
          )
        ],
      ),
    );
  }
}
