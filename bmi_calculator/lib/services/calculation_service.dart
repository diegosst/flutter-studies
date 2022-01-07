import 'dart:math';

import 'package:bmi_calculator/constants/constants.dart';
import 'package:bmi_calculator/enums/bmi_classification_enum.dart';

class CalculationService {

  double calculateBMI(int height, int weight) => (weight / pow((height / 100), 2));

  BMIClassification getBMIClassification(double value) {

    if (value < 18.5) {
      return BMIClassification.UNDERWEIGHT;
    }

    if (value >= 18.5 && value < 24.9) {
      return BMIClassification.NORMAL;
    }

    if (value >= 25 && value < 29.9) {
      return BMIClassification.OVERWEIGHT;
    }

    if (value >= 30 && value < 34.9) {
      return BMIClassification.OBESE;
    }

    return BMIClassification.EXTREMELY_OBESE;
  }

  String getBMIClassificationMessage(BMIClassification classification) {

    switch (classification) {

      case BMIClassification.UNDERWEIGHT:
        return 'You are at a less then normal body weight, consider consulting a professional to assist you on regularizing your alimentation.';

      case BMIClassification.NORMAL:
        return 'You are at a normal body weight.';

      case BMIClassification.OVERWEIGHT:
        return 'You are at a bit more than normal body weight, consider doing more exercises and regularizing your alimentation.';

      case BMIClassification.OBESE:
        return 'You are at a more than normal body weight, consider doing more exercises and regularizing your alimentation.';

      default:
        return 'You are at a critical range of body weight, we recommend you to do a follow up with a professional.';
    }
  }

  String getBMIClassificationLabel(BMIClassification classification) {

    switch (classification) {

      case BMIClassification.UNDERWEIGHT:
        return BMI_CLASSIFICATION_UNDERWEIGHT;

      case BMIClassification.NORMAL:
        return BMI_CLASSIFICATION_NORMAL;

      case BMIClassification.OVERWEIGHT:
        return BMI_CLASSIFICATION_OVERWEIGHT;

      case BMIClassification.OBESE:
        return BMI_CLASSIFICATION_OBESE;

      default:
        return BMI_CLASSIFICATION_EXTREMELY_OBESE;
    }
  }

}