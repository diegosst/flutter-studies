import 'dart:math';

import 'package:quizzler/question.dart';

class QuestionBank {

  List<Question> questions = [
    Question('The probability that you in any glass of water will find at least 1 molecule of water once drunk by Cleopatra is practically 100%.', true),
    Question('You replace every particle in your body every seven years. You are literally not the same person you were 7 years ago.', true),
    Question('Bubble wrap was originally designed to be used as wallpaper.', true),
    Question('There are more cars than people in Los Angeles.', true),
    Question('Cotton Candy was invented by a soldier.', false),
    Question('Just before the Nazis invaded Paris, H.A. and Margret Rey fled on bicycles. They were carrying the manuscript for Curious George.', true),
    Question('There are more atoms in a single glass of water than glasses of water in all the oceans of the Earth.', true),
    Question('Jupiter and Saturn have diamond rain.', true),
    Question('In New York City, approximately 1,600 people are eaten by other humans annually.', false),
    Question('Goats have square pupils.', false),
  ];

  Question getQuestion() {

    int number = new Random().nextInt(questions.length);

    return questions.removeAt(number);
  }

}