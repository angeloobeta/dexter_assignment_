import 'package:flutter/material.dart';

import '../../../model/utilities/constants/colors.dart';
import '../../uiElements/generalButtonWidget.dart';
import '../../uiElements/generalTextDisplay.dart';
import '../../uiElements/sizedBox.dart';

Widget buttonWidget(
    {required String text,
    required Function onPressed,
    double? width,
    Color? textColor,
    Color? buttonColor,
    Widget? child}) {
  return ButtonWidget(() {
    onPressed();
  },
      buttonColor ?? green,
      width ?? 327,
      52,
      Stack(
        children: [
          Center(
            child: GeneralTextDisplay(
                text, textColor ?? black, 1, 16, FontWeight.w600, "button"),
          ),
          child ?? S()
        ],
      ),
      Alignment.center,
      8);
}
