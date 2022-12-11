import 'package:flutter/material.dart';
import 'package:twitter_clone/Utls/text_style.dart';

class SocialButton extends StatelessWidget {
  VoidCallback onPress;
  String imageUrl;
  String title;
  SocialButton({Key? key,required this.imageUrl,required this.onPress,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50.0),
      onTap: onPress,
      child: Container(
        width: 350.0,
        height: 60.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          border: Border.all(
            color: Colors.grey
          ),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imageUrl,height: 25.0,width: 25.0,),
            SizedBox(
              width: 10.0,
            ),
            Text(title,style: bBody,),
          ],
        ),
      ),
    );
  }
}

class CreateButton extends StatelessWidget {
  VoidCallback onPress;
  String title;
  CreateButton({Key? key,required this.title,required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50.0),
      onTap: onPress,
      child: Container(
        width: 350.0,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: Colors.blue,
        ),
        child: Center(child: Text(title,style: body,)),
      ),
    );
  }
}
