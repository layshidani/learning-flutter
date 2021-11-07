import 'package:flutter/material.dart';

class MyLibrary extends StatefulWidget {
  const MyLibrary({Key? key}) : super(key: key);

  @override
  _MyLibraryState createState() => _MyLibraryState();
}

class _MyLibraryState extends State<MyLibrary> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Biblioteca",
        style: TextStyle(fontSize: 25),
      ),
    );
  }
}
