import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../model/imports/generalImport.dart';

Widget screenUi(
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
            color: color ?? Colors.grey,
            width: double.infinity,
            // height: MediaQuery.of(context).size.height * 0.8,
            // color:
            child: Stack(
              children: children,
            ),
          ),
        ),
      ));
}
