import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twitter_clone/Utls/app_colors.dart';
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

class RoundButton extends StatelessWidget {
  IconData Icons;
  VoidCallback onTap;
  String title;

  RoundButton({Key? key,required this.title,required this.onTap,required this.Icons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 130.0,
        height: 30.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          border: Border.all(
            color: AppColor.BlackColor,
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text(title,style: TextStyle(color: AppColor.BlackColor),)),
            Icon(Icons)
          ],
        ),
      ),
    );
  }
}

class TwitterButton extends StatelessWidget {
  VoidCallback onTap;
  String title;
  TwitterButton({Key? key,required this.onTap,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

      },
      child: Container(
        width: 120.0,
        height: 40.0,
        decoration: BoxDecoration(
          color: AppColor.BlueColor,
          borderRadius: BorderRadius.circular(30.0)
        ),
        child: Center(child: Text(title,style: TextStyle(color: AppColor.WhiteColor),)),
      ),
    );
  }
}


