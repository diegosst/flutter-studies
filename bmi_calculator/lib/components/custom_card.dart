import 'package:bmi_calculator/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {

  const CustomCard({Key? key, required this.color, this.onTap, this.child}) : super(key: key);

  final Color color;
  final VoidCallback? onTap;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: child,
        margin: EdgeInsets.all(CUSTOM_CARD_MARGIN),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(CUSTOM_CARD_BORDER_RADIUS),
          color: color
        ),
      ),
      onTap: onTap,
    );
  }
}