import 'dart:ui';

import 'package:flutter/material.dart';

Widget baseUi(
    {required List<Widget> children,
    required bool allowBackButton,
    Color? color}) {
  return WillPopScope(
      onWillPop: () async {
        return allowBackButton;
      },
      child: SafeArea(
        top: true,
        bottom: false,
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              color: color ?? Colors.transparent,
              image: DecorationImage(
                  image: AssetImage('assets/backImage.png'), fit: BoxFit.cover),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                // color:
                child: Stack(
                  children: children,
                ),
              ),
            ),
          ),
        ),
      ));
}
