import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildKey(1, Colors.red),
                buildKey(2, Colors.orange),
                buildKey(3, Colors.yellow),
                buildKey(4, Colors.green),
                buildKey(5, Colors.blueGrey),
                buildKey(6, Colors.blue),
                buildKey(7, Colors.purple),
              ],
            )
          ),
        ),
      ),
    );
  }

  Expanded buildKey(int number, MaterialColor color) {
    return Expanded(
      child: MaterialButton(
        onPressed: () {
          playSound(number);
        },
        color: color,
      ),
    );
  }

  void playSound(int number) {
    final player = AudioCache();
    player.play("note$number.wav");
  }

}
