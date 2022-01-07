import 'package:bmi_calculator/components/custom_action_button.dart';
import 'package:bmi_calculator/components/custom_card.dart';
import 'package:bmi_calculator/components/custom_icon_box.dart';
import 'package:bmi_calculator/components/custom_round_icon_button.dart';
import 'package:bmi_calculator/components/custom_slider.dart';
import 'package:bmi_calculator/constants/constants.dart';
import 'package:bmi_calculator/enums/bmi_classification_enum.dart';
import 'package:bmi_calculator/enums/gender_enum.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:bmi_calculator/services/calculation_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender gender = CUSTOM_CARD_DEFAULT_GENDER;

  int height = CUSTOM_CARD_DEFAULT_HEIGHT;
  int weight = CUSTOM_CARD_DEFAULT_WEIGHT;
  int age = CUSTOM_CARD_DEFAULT_AGE;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(APP_TITLE),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomCard(
                    color: getCurrentCardColor(Gender.MALE),
                    child: CustomIconBox(
                      icon: FontAwesomeIcons.mars,
                      text: CUSTOM_CARD_MALE_TEXT),
                      onTap: changeGender(Gender.MALE),
                  ),
                ),
                Expanded(
                  child: CustomCard(
                    color: getCurrentCardColor(Gender.FEMALE),
                    child: CustomIconBox(
                      icon: FontAwesomeIcons.venus,
                      text: CUSTOM_CARD_FEMALE_TEXT),
                      onTap: changeGender(Gender.FEMALE),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: CustomCard(
              color: CUSTOM_CARD_INACTIVE_COLOR,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [
                  Text(CUSTOM_CARD_HEIGHT_TEXT, style: CUSTOM_CARD_LABEL_TEXT_STYLE),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget> [
                      Text(height.toString(), style: CUSTOM_CARD_VALUE_TEXT_STYLE),
                      Text(DEFAULT_CENTIMETERS_TEXT, style: CUSTOM_CARD_LABEL_TEXT_STYLE)
                    ],
                  ),
                  CustomSlider(
                    min: 100,
                    max: 220,
                    value: height.toDouble(),
                    onChanged: (double value) {
                      setState(() {
                        this.height = value.toInt();
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CustomCard(
                    color: CUSTOM_CARD_INACTIVE_COLOR,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget> [
                        Text(CUSTOM_CARD_WEIGHT_TEXT, style: CUSTOM_CARD_LABEL_TEXT_STYLE),
                        Text(weight.toString(), style: CUSTOM_CARD_VALUE_TEXT_STYLE),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomRoundIconButton(
                              icon: Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            CustomRoundIconButton(
                              icon: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: CustomCard(
                    color: CUSTOM_CARD_INACTIVE_COLOR,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget> [
                        Text(CUSTOM_CARD_AGE_TEXT, style: CUSTOM_CARD_LABEL_TEXT_STYLE),
                        Text(age.toString(), style: CUSTOM_CARD_VALUE_TEXT_STYLE),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomRoundIconButton(
                              icon: Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            CustomRoundIconButton(
                              icon: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          CustomActionButton(
            text: BOTTOM_BUTTON_CALCULATE_TEXT,
            onTap: () {

              CalculationService service = new CalculationService();
              
              double value = service.calculateBMI(height, weight);
              
              BMIClassification classification = service.getBMIClassification(value);
              String classificationLabel = service.getBMIClassificationLabel(classification);
              String classificationMessage = service.getBMIClassificationMessage(classification);



              Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(
                  classification: classificationLabel,
                  message: classificationMessage,
                  value: value)
                )
              );
            }
          )
        ],
      ),
    );
  }

  VoidCallback changeGender(Gender gender) {
    return () {
      setState(() {
        this.gender = gender;
      });
    };
  }

  Color getCurrentCardColor(Gender gender) {
    return this.gender == gender ? CUSTOM_CARD_ACTIVE_COLOR : CUSTOM_CARD_INACTIVE_COLOR;
  }

}
