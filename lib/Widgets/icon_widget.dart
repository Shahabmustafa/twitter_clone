import 'package:flutter/material.dart';
import 'package:twitter_clone/Utls/app_colors.dart';

class IconWidget extends StatelessWidget {
  IconData icon;
  VoidCallback onTap;
  IconWidget({Key? key,required this.onTap,required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Icon(icon,color: AppColor.BlueColor,size: 25.0,),
    );
  }
}

