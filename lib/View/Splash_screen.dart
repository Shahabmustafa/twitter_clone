import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:twitter_clone/View/Home_Screen.dart';
import 'Auth/Login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _auth = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      if(_auth == null){
        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
      }else{
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset('images/twitter.png',
              color: Colors.white,
              width: 100,
              height: 100,
            ),
          ),
        ],
      ),
    );
  }
}
