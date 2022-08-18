import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart' as FLToast;
import 'package:get/get.dart';

class SahaAlert {
  static void showError(
      {String? message, Color? color, Color? textColor}) async {
    FLToast.Fluttertoast.showToast(
      msg: message!,
      toastLength: FLToast.Toast.LENGTH_SHORT,
      gravity: FLToast.ToastGravity.CENTER,
      timeInSecForIosWeb: 3,

      backgroundColor: color ?? Colors.red,
      textColor: textColor ?? Colors.white,
      fontSize: 16.0,
    );
  }

  static void showWarning({
    String message = "",
    String title = "Saha",
  }) {
    FLToast.Fluttertoast.showToast(msg: message);
  }

  static void showSuccess({
    String message = "",
    String title = "Saha",
  }) {
    FLToast.Fluttertoast.showToast(msg: message,
      toastLength: FLToast.Toast.LENGTH_SHORT,
      gravity: FLToast.ToastGravity.CENTER,
      timeInSecForIosWeb: 2,

      backgroundColor:Colors.green,
      textColor:  Colors.white,
      fontSize: 16.0,
    );
  }

  static void showToastMiddle(
      {String? message, Color? color, Color? textColor}) {
    FLToast.Fluttertoast.showToast(
        msg: message!,
        toastLength: FLToast.Toast.LENGTH_SHORT,
        gravity: FLToast.ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: color ?? Colors.red,
        textColor: textColor ?? Colors.white,
        fontSize: 16.0);
  }
}
