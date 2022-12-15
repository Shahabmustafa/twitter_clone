
import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utls{
  static toastMessage(String message){
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.red
    );
  }
  static void flushBarErrorMessage(String message,BuildContext context){
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.decelerate,
        margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
        padding: EdgeInsets.all(15.0),
        reverseAnimationCurve: Curves.easeInOut,
        positionOffset: 20.0,
        backgroundColor: Colors.red,
        icon: Icon(Icons.error),
        message: message,
        duration: Duration(seconds: 5),
      )..show(context),
    );
  }
}