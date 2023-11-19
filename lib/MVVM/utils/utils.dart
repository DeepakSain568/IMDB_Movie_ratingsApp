import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static toastMessage(String message) {
    Fluttertoast.showToast(msg: message, toastLength: Toast.LENGTH_LONG);
  }

  static FlushBarErrorMessage(String message, BuildContext context) {
    print('flushbar');
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          padding: EdgeInsets.all(15),
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          icon: Icon(
            Icons.error,
            size: 28,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(20),
          message: message,
          backgroundColor: Colors.black,
          duration: Duration(seconds: 2),
          animationDuration: Duration(seconds: 1),
          flushbarPosition: FlushbarPosition.TOP,
        )..show(context));
  }

  static snakBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Colors.green,
      // clipBehavior: Clip.antiAliasWithSaveLayer,
    ));
  }
}
