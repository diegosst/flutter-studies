import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quizzler/question.dart';
import 'package:quizzler/question_bank.dart';
import 'package:quizzler/score_bank.dart';

void main() {
  runApp(Quizzler());
}

class Quizzler extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          )
        ),
      )
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}


class _QuizPageState extends State<QuizPage> {

  List<Widget> scores = [];

  QuestionBank questionBank = new QuestionBank();
  ScoreBank scoreBank = new ScoreBank();

  late Question question = questionBank.getQuestion();

  void evaluateResponse(bool answer) {

    bool score = question.answer == answer;

    scoreBank.addScore(score);

    setState(() {

      scores.add(buildCheckmark(score));

      question = questionBank.getQuestion();
    });
  }

  Widget buildCheckmark(bool answer) {
    return Icon(
        Icons.check,
        color: answer ? Colors.green : Colors.red
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment:MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                question.text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                )
              )
            )
          )
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  onPrimary: Colors.white
              ),
              child: Text(
                'True',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0
                ),
              ),
              onPressed: () {
                evaluateResponse(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                onPrimary: Colors.white
              ),
              child: Text(
                'False',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0
                ),
              ),
              onPressed: () {
                evaluateResponse(false);
              },
            ),
          ),
        ),
        Row(
          children: scores,
        )
      ],
    );
  }
}

