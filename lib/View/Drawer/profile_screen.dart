import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:twitter_clone/View/Auth/google_sign_in.dart';
import 'package:twitter_clone/View/Drawer/edit_profile.dart';
import 'package:twitter_clone/Widgets/social_button.dart';

import '../../Utls/app_colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _auth = FirebaseAuth.instance.currentUser;
  ValueNotifier<bool> _comment = ValueNotifier<bool>(true);
  ValueNotifier<bool> _like = ValueNotifier<bool>(true);
  ValueNotifier<bool> _isretwitte = ValueNotifier<bool>(true);
  ValueNotifier<bool> _isshare = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${_auth!.displayName}"),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: double.infinity,
                    height: 200.0,
                    color: Colors.green,
                    ),
                  Positioned(
                    left: 10.0,
                    bottom: -50.0,
                    child: Container(
                      child: CircleAvatar(
                        backgroundImage: NetworkImage("${_auth!.photoURL}"),
                        radius: 50.0,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TwitterButton(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfile()));
                      },
                      title: 'Edit Profile'
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 10.0,
                      ),
                      Text('${_auth!.displayName}',
                        style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    children: const [
                      Icon(Icons.location_on),
                      Text('Charsadda,Pakistan'),
                      SizedBox(
                        width: 10.0,
                      ),
                      Icon(Icons.calendar_month_sharp),
                      Text("Joined June 2020")
                    ],
                  ),
                  Row(
                    children: [
                      TextButton(
                          onPressed: (){},
                        child: Text('0 Following'),
                      ),
                      TextButton(
                        onPressed: (){},
                        child: Text('0 Followers'),
                      ),
                    ],
                  ),
                  for(int i = 0; i < 6; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 10.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage("${_auth!.photoURL}"),
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            Row(
                              children: [
                                Text(
                                  '${_auth!.displayName}'
                                  ,style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
                                ),
                                ),
                                Icon(Icons.verified,color: AppColor.BlueColor,),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 40.0),
                              child: Text('airline never ever flying with them again'),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          width: double.infinity,
                          height: 350.0,
                          color: Colors.blue,
                          child: Image.asset('images/twitter.png'),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ValueListenableBuilder(
                                valueListenable: _comment,
                                builder: (context,value,child){
                                  return IconButton(
                                    onPressed: (){
                                      _comment.value =! _comment.value;
                                    },
                                    icon: Icon(_comment.value ? Icons.messenger_outline : Icons.message,color: Colors.blue,),
                                  );
                                }),
                            ValueListenableBuilder(
                                valueListenable: _like,
                                builder: (context,child,value){
                                  return IconButton(
                                    onPressed: (){
                                      _like.value =! _like.value;
                                    },
                                    icon: Icon(_like.value ? Icons.favorite_border_rounded : Icons.favorite,color: Colors.red,),
                                  );
                                }),
                            ValueListenableBuilder(
                                valueListenable: _isretwitte,
                                builder: (context,child,value){
                                  return IconButton(
                                    onPressed: (){
                                      _isretwitte.value =! _isretwitte.value;
                                    },
                                    icon: Icon(_isretwitte.value ? Icons.cloud_queue_outlined : Icons.cloud,color: Colors.green,),
                                  );
                                }),
                            ValueListenableBuilder(
                                valueListenable: _isshare,
                                builder: (context,child,value){
                                  return IconButton(
                                    onPressed: (){
                                      _isshare.value =! _isshare.value;
                                    },
                                    icon: Icon(_isshare.value ? Icons.upload_outlined : Icons.upload,color: Colors.blue,),
                                  );
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
