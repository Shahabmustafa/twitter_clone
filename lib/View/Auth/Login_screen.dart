import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:twitter_clone/Utls/flutter_toest.dart';
import 'package:twitter_clone/Utls/text_style.dart';
import 'package:twitter_clone/View/Home_Screen.dart';
import 'package:twitter_clone/View/sign_up.dart';
import 'package:twitter_clone/Widgets/social_button.dart';

import 'google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  static String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static RegExp regExp = new RegExp(p);

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  ValueNotifier<bool> _obesurePassword = ValueNotifier<bool>(true);
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: ImageStyle(title: 'images/twitter.png')),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0.1,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0,vertical: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  alignment: Alignment.center,
                  width: 300,
                  child: Text("See what's happening in the world right now.",style: title,)
              ),
             SizedBox(
               height: 40.0,
             ),
             Form(
               key: _formKey,
               child: Column(
                 children: [
                   TextFormField(
                     validator: (email){
                       if(email!.isEmpty){
                         return 'Please Inter your Email';
                       }else if(!regExp.hasMatch(email)){
                         return 'Please Enter your Valid Email';
                       }else{
                         return null;
                       }
                     },
                     controller: email,
                     keyboardType: TextInputType.emailAddress,
                     decoration: const InputDecoration(
                       hintText: 'Email address',
                       label: Text('Email address'),
                       prefixIcon: Icon(Icons.alternate_email)
                     ),
                   ),
                   const SizedBox(
                     height: 20.0,
                   ),
                   ValueListenableBuilder(valueListenable: _obesurePassword,
                       builder: (context,value,child){
                     return TextFormField(
                       validator: (password){
                         if(password!.isEmpty){
                           return 'Please inter Your Password';
                         }else if(password.length < 6){
                           return 'Please Minimum Six Digits Password';
                         }else{
                           return null;
                         }
                       },
                       controller: password,
                       obscureText: _obesurePassword.value,
                       decoration: InputDecoration(
                         hintText: 'Password',
                         label: Text('Password'),
                         prefixIcon: Icon(Icons.password),
                         suffixIcon: InkWell(
                           onTap: (){
                             _obesurePassword.value =! _obesurePassword.value;
                           },
                             child: Icon(
                               _obesurePassword.value ?
                               Icons.visibility_off_rounded :
                                 Icons.visibility
                             )),
                       ),
                     );
                       }),
                   const SizedBox(
                     height: 20.0,
                   ),
                   CreateButton(
                       title: 'Log in',
                       onPress: ()async{
                         if(_formKey.currentState!.validate()){
                           await _auth.signInWithEmailAndPassword(
                             email: email.text.toString(),
                             password: password.text.toString(),
                           ).then((value){
                             // if(value.user!.email != null){
                             // }else{
                             //   Utls.flushBarErrorMessage('User have Email is not Correct Login ', context);
                             // }
                             Navigator.push(context, MaterialPageRoute(builder:(context) => HomePage()));
                             Utls.flushBarErrorMessage('User have Succesfully Login ${value.user!.email}', context);
                             print(value.user!.email);
                           }).onError((error, stackTrace){
                             Utls.flushBarErrorMessage('${error.toString()}', context);
                             print(error.toString());
                           });
                         }
                       }
                   ),
                   const SizedBox(
                     height: 20.0,
                   ),
                   TextButton(
                       onPressed: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                       },
                     child: Text("Don't have an account? SignUp"),
                   ),
                   const Text('or'),
                   const SizedBox(
                     height: 20.0,
                   ),
                   SocialButton(
                       imageUrl: 'images/google.png',
                       onPress: ()async{
                        await signInWithGoogle();
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                       },
                       title: 'Continue with Google'),
                   const SizedBox(
                     height: 20.0,
                   ),
                   SocialButton(
                     imageUrl: 'images/apple.png',
                     onPress: (){
                       print('Click Apple');
                     },
                     title: 'Continue with Apple',
                   ),
                   const SizedBox(
                     height: 20.0,
                   ),
                 ],
               ),
             ),
            ],
          ),
        ),
      ),
    );
  }
}
