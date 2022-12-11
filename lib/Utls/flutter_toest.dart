
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utls{
  static toastMessage(String message){
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.red
    );
  }
}