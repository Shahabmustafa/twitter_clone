import 'package:flutter/material.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          CircleAvatar(),
          UserAccountsDrawerHeader(
            accountName:Text( 'Shahab Mustafa'),
            accountEmail: Text('shahabmustafa57@gmail.com'),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: (){

            },
          ),
          ListTile(
            leading: Icon(Icons.featured_play_list_sharp),
            title: Text('Profile'),
            onTap: (){

            },
          ),
        ],
      ),
    );
  }
}
