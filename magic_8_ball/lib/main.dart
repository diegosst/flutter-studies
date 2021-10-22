import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Ask Me Anything',
          style: TextStyle(
              color: Colors.white
          ),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Magic8(),
    )
  ));
}

class Magic8 extends StatefulWidget {
  const Magic8({Key? key}) : super(key: key);

  @override
  _Magic8State createState() => _Magic8State();
}

class _Magic8State extends State<Magic8> {

  var number = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: () {
                changeBall();
              },
              child: Image.asset('images/ball$number.png'),
            ),
          ),
        ],
      ),
    );
  }

  void changeBall() {
    setState(() {
      number = Random().nextInt(4) + 2;
    });
  }

}
