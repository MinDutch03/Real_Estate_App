import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_properties/constants/constants.dart';
import 'package:my_properties/pages/screens.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  DateTime? currentBackPressTime;
  int currentIndex = 1;

  changeIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        child: (currentIndex == 1)
            ? Home()
            : (currentIndex == 2)
                ? ChatList()
                : (currentIndex == 3)
                    ? Shortlisted()
                    : Settings(),
        onWillPop: () async {
          bool backStatus = onWillPop();
          if (backStatus) {
            exit(0);
          }
          return false;
        },
      ),
      bottomNavigationBar: Material(
        elevation: 2.0,
        child: Container(
          height: 60.0,
          width: double.infinity,
          color: whiteColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              bottomNavigationBarItem(Icons.home, 1),
              bottomNavigationBarItem(Icons.chat, 2),
              bottomNavigationBarItem(Icons.favorite, 3),
              bottomNavigationBarItem(Icons.settings, 4),
            ],
          ),
        ),
      ),
    );
  }

  bottomNavigationBarItem(icon, index) {
    return InkWell(
      borderRadius: BorderRadius.circular(25.0),
      onTap: () => changeIndex(index),
      child: Container(
        width: 50.0,
        height: 50.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: (index == currentIndex)
              ? greyColor.withOpacity(0.2)
              : Colors.transparent,
        ),
        child: Icon(
          icon,
          size: 24.0,
          color: primaryColor,
        ),
      ),
    );
  }

  onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
        msg: 'Press Back Once Again to Exit.',
        backgroundColor: Colors.black,
        textColor: whiteColor,
      );
      return false;
    } else {
      return true;
    }
  }
}
