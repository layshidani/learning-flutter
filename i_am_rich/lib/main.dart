import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.blueGrey[200]),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('I am Rich :D')),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: const Center(
          child: Image(
            image: NetworkImage(
                'https://media.istockphoto.com/photos/business-man-rich-millionaire-billionaire-with-many-banknote-dollars-picture-id1016186674?k=20&m=1016186674&s=612x612&w=0&h=yyPL5llRES8Jz60yqk1e41gb7MkaPofy1SIlBXAkEbw='),
          ),
        ),
      ),
    ),
  );
}
