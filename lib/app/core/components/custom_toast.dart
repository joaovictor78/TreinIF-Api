import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class CustomToast {
  static void showToast(String msg,
      {Toast toastLength = Toast.LENGTH_SHORT,
      ToastGravity gravity = ToastGravity.BOTTOM,
      int timeInSecForIosWeb = 1,
      Color backgroundColor = Colors.greenAccent,
      Color textColor = Colors.white,
      double fontSize = 15.0}) {
    Fluttertoast.showToast( 
        msg: msg,
        toastLength: toastLength,
        gravity: gravity,
        timeInSecForIosWeb: timeInSecForIosWeb,
        backgroundColor: backgroundColor,
        textColor: textColor,
        fontSize: fontSize);
  }
}