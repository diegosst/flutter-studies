import 'package:bmi_calculator/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomSlider extends StatelessWidget {

  const CustomSlider({Key? key, required this.min, required this.max, required this.value, this.onChanged}) : super(key: key);

  final double min;
  final double max;
  final double value;
  final ValueChanged<double>? onChanged;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: CUSTOM_SLIDER_ACTIVE_TRACK_COLOR,
        inactiveTrackColor: CUSTOM_SLIDER_INACTIVE_TRACK_COLOR,
        trackHeight: CUSTOM_SLIDER_TRACK_HEIGHT,
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: CUSTOM_SLIDER_THUMB_SHAPE_RADIUS),
        thumbColor: CUSTOM_SLIDER_THUMB_COLOR,
        overlayShape: RoundSliderOverlayShape(overlayRadius: CUSTOM_SLIDER_OVERLAY_SHAPE_RADIUS),
        overlayColor: CUSTOM_SLIDER_OVERLAY_COLOR
      ),
      child: Slider(
        value: value,
        min: min,
        max: max,
        onChanged: onChanged,
      )
    );
  }
}