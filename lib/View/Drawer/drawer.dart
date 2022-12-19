import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:twitter_clone/View/Auth/Login_screen.dart';
import 'package:twitter_clone/View/Drawer/profile_screen.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  final _auth = FirebaseAuth.instance;
  final _authUser = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
           UserAccountsDrawerHeader(
             currentAccountPicture: CircleAvatar(
               backgroundImage: NetworkImage("${_authUser!.photoURL}"),
             ),
            accountName:Text( '${_authUser!.displayName}'),
            accountEmail: Text('${_authUser!.email}'),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen() ));
            },
          ),
          ListTile(
            leading: Icon(Icons.featured_play_list_sharp),
            title: Text('Lists'),
            onTap: (){
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Sign Out'),
            onTap: ()async{
              await _auth.signOut();
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
            },
          ),
        ],
      ),
    );
  }
}
