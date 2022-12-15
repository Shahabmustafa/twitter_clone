import 'package:flutter/material.dart';
import 'package:twitter_clone/Utls/app_colors.dart';
import 'package:twitter_clone/View/Drawer/drawer.dart';
import 'package:twitter_clone/View/Navigation_bottom/home.dart';
import 'package:twitter_clone/View/Navigation_bottom/message.dart';
import 'package:twitter_clone/View/Navigation_bottom/notification.dart';
import 'package:twitter_clone/View/Navigation_bottom/search.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  int _currentIndex = 0;
  List<Widget> bottomNavigation = [
    HomeNavigationBottom(),
    SearchNavigationBottom(),
    NotificationNavigationBottom(),
    MessageNavigationBottom(),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerPage(),
      appBar: AppBar(
        title: Text('Home',style: TextStyle(color: AppColor.BlackColor),),
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (value){
          setState(() {
            _currentIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: '',
              icon: Icon(Icons.home_outlined),
          ),
          BottomNavigationBarItem(
              label: '',
              icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
              label: '',
              icon: Icon(Icons.notifications_outlined),
          ),
          BottomNavigationBarItem(
              label: '',
              icon: Icon(Icons.email_outlined),
          ),
        ],
      ),
      body: Center(child: bottomNavigation[_currentIndex]),
    );
  }
}
