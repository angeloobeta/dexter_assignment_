import 'dart:ui';

import 'package:dexter_assignment/view/pages/task/completedTask.dart';
import 'package:dexter_assignment/view/pages/task/pendingTask.dart';
import 'package:flutter/material.dart';

import '../../../model/imports/generalImport.dart';
import 'AllTodoTask.dart';

Widget mainUi(context,
    {required List<Widget> children,
    required Function onTapFunction,
    required bool allowBackButton,
    Color? color}) {
  List<Widget> screens = [AllTodoTask(), CompletedTask(), PendingTask()];
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
            backgroundColor: white,
            unselectedItemColor: red,
            selectedItemColor: red,
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
