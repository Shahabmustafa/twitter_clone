import 'package:flutter/cupertino.dart';

class Favourite with ChangeNotifier{
  bool _iscomment = false;

  clickOn(){
    _iscomment = true;
    notifyListeners();
  }
  clickOff(){
    _iscomment = false;
    notifyListeners();
  }

}