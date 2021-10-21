import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Rolling Dice!'),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: DicePage(),
    )
  ));
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {

  var leftDice = 1;
  var rightDice = 6;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: () {
                changeDiceStates();
              },
              child: Image.asset('images/dice_$leftDice.png')
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                changeDiceStates();
              },
              child: Image.asset('images/dice_$rightDice.png')
            ),
          ),
        ]
      ),
    );
  }

  void changeDiceStates() {
    setState(() {
      leftDice = getRandomDice();
      rightDice = getRandomDice();
    });
  }

  int getRandomDice() {
    return new Random().nextInt(6) + 1;
  }
}


