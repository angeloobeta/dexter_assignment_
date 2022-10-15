import 'package:dexter_assignment/model/utilities/constants/strings.dart';
import 'package:flutter/material.dart';

class GeneralIconDisplay extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final Color iconColor;
  final Key iconKey;

  GeneralIconDisplay(this.icon, this.iconColor, this.iconKey, this.iconSize);

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      key: iconKey,
      size: sS(context).cH(height: iconSize),
      color: iconColor,
    );
  }
}
