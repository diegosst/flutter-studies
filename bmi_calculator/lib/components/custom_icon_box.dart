import 'package:bmi_calculator/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomIconBox extends StatelessWidget {

  const CustomIconBox({Key? key, required this.icon, required this.text, this.child}) : super(key: key);

  final IconData icon;
  final String text;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget> [
        Icon(icon, size: ICON_BOX_ICON_SIZE),
        SizedBox(height: ICON_BOX_SPACE),
        Text(text, style: CUSTOM_CARD_LABEL_TEXT_STYLE)
      ],
    );
  }
}