import 'package:flutter/material.dart';

 const title = TextStyle(
   fontWeight: FontWeight.bold,
    fontSize: 35,
  );

const subTitle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 20,
);

const body = TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.white
);

const bBody = TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.black,
);

class ImageStyle extends StatelessWidget {
  String title;
  ImageStyle({Key? key,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(title,height: 30.0,width: 30.0,color: Colors.blue,);
  }
}
