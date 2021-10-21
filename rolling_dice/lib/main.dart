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

class DicePage extends StatelessWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: () {  },
              child: Image.asset('images/dice_1.png')
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {  },
              child: Image.asset('images/dice_2.png')
            ),
          ),
        ]
      ),
    );
  }
}


