import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('I\'m Poor'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: const Center(
        child: Image(
          image: AssetImage('images/flying-money.png'),
        ),
      ),
    ),
  ));
}


