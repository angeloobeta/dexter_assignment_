import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../model/imports/generalImport.dart';

Widget mainUi(
    {required List<Widget> children,
    // required VoidCallback? onTapFunction(int),
    required bool allowBackButton,
    Color? color}) {
  int selectedIndex = 1;
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
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            backgroundColor: white,
            unselectedItemColor: red,
            selectedItemColor: red,
            // onTap: onTapFunction,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.fact_check_outlined,
                    color: red,
                    size: 50,
                  ),
                  label: "Task"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.pending_actions_rounded,
                    color: red,
                    size: 50,
                  ),
                  label: "Pending"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.done,
                    color: red,
                    size: 50,
                  ),
                  label: "Completed")
            ],
          ),
        ),
      ));
}
