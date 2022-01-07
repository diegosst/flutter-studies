import 'package:bmi_calculator/constants/constants.dart';
import 'package:flutter/cupertino.dart';

class CustomActionButton extends StatelessWidget {

  CustomActionButton({Key? key, required this.text, this.onTap}) : super(key: key);

  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
          color: BOTTOM_BUTTON_COLOR,
          margin: EdgeInsets.only(top: BOTTOM_BUTTON_MARGIN_TOP),
          width: BOTTOM_BUTTON_WIDTH,
          height: BOTTOM_BUTTON_HEIGHT,
          child: Center(
              child: Text(text, style: BOTTOM_BUTTON_TEXT_STYLE)
          ),
        ),
        onTap: onTap
    );
  }

}