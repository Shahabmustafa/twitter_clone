import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:twitter_clone/Widgets/image_update.dart';
import 'package:twitter_clone/Widgets/social_button.dart';

import 'icon_widget.dart';

class PostShare extends StatefulWidget {
  const PostShare({Key? key}) : super(key: key);

  @override
  State<PostShare> createState() => _PostShareState();
}

class _PostShareState extends State<PostShare> {
  final _auth = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 25.0,
              backgroundImage: NetworkImage("${_auth!.photoURL}"),
            ),
            const SizedBox(
              width: 10.0,
            ),
            RoundButton(title: 'Everyone',
              onTap: (){},
              Icons: Icons.arrow_drop_down,
            ),
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        TextFormField(
          style: const TextStyle(
            height: 1.5,
          ),
          decoration: const InputDecoration(
              hintText: "What's Happening?"
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconWidget(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ImageUpdate()));
                  },
                  icon: Icons.photo,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                IconWidget(
                  onTap: (){},
                  icon: Icons.gif_box_outlined,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                IconWidget(
                  onTap: (){},
                  icon: Icons.poll,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                IconWidget(
                  onTap: (){},
                  icon: Icons.emoji_emotions_outlined,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                IconWidget(
                  onTap: (){},
                  icon: Icons.calendar_month_sharp,
                ),
              ],
            ),
            TwitterButton(
              onTap: (){},
              title: 'Twitter',
            ),
          ],
        ),
      ],
    );
  }
}
