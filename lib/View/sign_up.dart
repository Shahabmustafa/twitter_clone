import 'package:flutter/material.dart';
import 'package:twitter_clone/Utls/flutter_toest.dart';
import 'package:twitter_clone/Widgets/social_button.dart';
class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  static String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static RegExp regExp = new RegExp(p);
  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);
  ValueNotifier<bool> _obsecureConfirmePassword = ValueNotifier<bool>(true);
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController c_password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Image.asset('images/twitter.png',width: 100.0,height: 100.0,)),
              TextFormField(
                validator: (name){
                  if(name!.isEmpty){
                    return 'Please Enter Your Email';
                  }
                },
                controller: name,
                decoration: const InputDecoration(
                  label: Text('Name'),
                  hintText: 'Name',
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                validator: (phone){
                  if(phone!.isEmpty){
                    return 'Enter Your Phone Number';
                  }else if(phone.length < 11){
                    return 'Valid Phone Number';
                  }
                },
                controller: phone,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                    label: Text('Phone'),
                    hintText: 'Phone',
                  prefixIcon: Icon(Icons.phone),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                validator: (email){
                  if(email!.isEmpty){
                    return 'Please Enter Your Email';
                  }else if(!regExp.hasMatch(email)){
                    return 'Please Enter Your Valid Email';
                  }
                },
                controller: email,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    label: Text('Email Address'),
                    hintText: 'Email Address',
                    prefixIcon: Icon(Icons.alternate_email),
              ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              ValueListenableBuilder(
                  valueListenable: _obsecurePassword,
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
                      obscureText: _obsecurePassword.value,
                      controller: password,
                      decoration: InputDecoration(
                          label: Text('Passeord'),
                          prefixIcon: Icon(Icons.password),
                          suffixIcon: InkWell(
                            onTap: (){
                              _obsecurePassword.value =! _obsecurePassword.value;
                            },
                              child: Icon(
                                  _obsecurePassword.value ?
                                  Icons.visibility_off :
                                  Icons.visibility
                              ),
                          ),
                          hintText: 'Password'
                      ),
                    );
                  }
                  ),
              const SizedBox(
                height: 10.0,
              ),
              ValueListenableBuilder(
                  valueListenable: _obsecureConfirmePassword,
                  builder: (context,value,child){
                    return TextFormField(
                      validator: (c_password){
                        if(c_password!.isEmpty){
                          return 'Please Inter Your Confirm Password';
                        }else if(c_password.length < 6){
                          return 'Please Minimum Six Digits Password';
                        }else{
                          return null;
                        }
                      },
                      obscureText: _obsecureConfirmePassword.value,
                      controller: c_password,
                      decoration: InputDecoration(
                          label: Text('Confirm Passeord'),
                          prefixIcon: Icon(Icons.password),
                          suffixIcon: InkWell(
                            onTap: (){
                              _obsecureConfirmePassword.value =! _obsecureConfirmePassword.value;
                            },
                            child: Icon(
                              _obsecureConfirmePassword.value ? Icons.visibility_off :
                                Icons.visibility),
                          ),
                          hintText: 'Confirm Password'
                      ),
                    );
                  }),
              const SizedBox(
                height: 30.0,
              ),
              CreateButton(
                  title: 'Create account',
                  onPress: (){
                    if(_formKey.currentState!.validate()){

                    }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
