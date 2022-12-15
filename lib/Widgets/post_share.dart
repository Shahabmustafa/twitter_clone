import 'package:flutter/material.dart';
import 'package:twitter_clone/Widgets/social_button.dart';

import 'icon_widget.dart';

class PostShare extends StatefulWidget {
  const PostShare({Key? key}) : super(key: key);

  @override
  State<PostShare> createState() => _PostShareState();
}

class _PostShareState extends State<PostShare> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 25.0,
            ),
            SizedBox(
              width: 10.0,
            ),
            RoundButton(title: 'Everyone',
              onTap: (){},
              Icons: Icons.arrow_drop_down,
            ),
          ],
        ),
        SizedBox(
          height: 10.0,
        ),
        TextFormField(
          style: TextStyle(
            height: 1.5,
          ),
          decoration: InputDecoration(
              hintText: "What's Happening?"
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconWidget(
                  onTap: (){},
                  icon: Icons.photo,
                ),
                SizedBox(
                  width: 10.0,
                ),
                IconWidget(
                  onTap: (){},
                  icon: Icons.gif_box_outlined,
                ),
                SizedBox(
                  width: 10.0,
                ),
                IconWidget(
                  onTap: (){},
                  icon: Icons.poll,
                ),
                SizedBox(
                  width: 10.0,
                ),
                IconWidget(
                  onTap: (){},
                  icon: Icons.emoji_emotions_outlined,
                ),
                SizedBox(
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
