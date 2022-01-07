import 'package:bmi_calculator/components/custom_action_button.dart';
import 'package:bmi_calculator/components/custom_card.dart';
import 'package:bmi_calculator/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {

  ResultPage({required this.classification, required this.message, required this.value});

  final String classification;
  final String message;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(APP_TITLE),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget> [
          Text(RESULT_TITLE_TEXT, style: RESULT_TITLE_STYLE),
          Expanded(
            child: CustomCard(
              color: CUSTOM_CARD_ACTIVE_COLOR,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget> [
                  Text(classification, style: RESULT_CARD_TITLE_STYLE),
                  Text(value.toStringAsFixed(2), style: RESULT_CARD_VALUE_STYLE),
                  Text(message, textAlign: TextAlign.center)
                ]
              ),
            ),
          ),
          CustomActionButton(
            text: BOTTOM_BUTTON_RECALCULATE_TEXT,
            onTap: () => Navigator.pop(context)
          )
        ],
      ),
    );
  }

}
