import 'package:flutter/material.dart';

class CustomRoundIconButton extends StatelessWidget {

  const CustomRoundIconButton({Key? key, required this.icon, this.onPressed}) : super(key: key);

  final Icon icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      fillColor: Color(0xFF4C4F5E),
      shape: CircleBorder(),
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(
        width: 45.0,
        height: 45.0,
      ),
      child: icon,
    );
  }
}