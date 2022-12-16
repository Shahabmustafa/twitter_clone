import 'package:flutter/material.dart';
import 'package:twitter_clone/Utls/app_colors.dart';
import 'package:twitter_clone/Widgets/post_share.dart';

class HomeNavigationBottom extends StatefulWidget {
  const HomeNavigationBottom({Key? key}) : super(key: key);

  @override
  State<HomeNavigationBottom> createState() => _HomeNavigationBottomState();
}

class _HomeNavigationBottomState extends State<HomeNavigationBottom> {
  var time = DateTime.now();
  bool _iscomment = false;
  bool _islike = false;
  bool _retwitte = false;
  bool _share = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
              child: PostShare(),
            ),
            for(int i = 0; i<6; i++)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        child: Image.asset('images/google.png',),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Row(
                            children:[
                              Text(
                                    'Shahab Mustafa'
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
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40.0),
                          child: Text('airline never ever flying with them again'),
                      ),
                    ],
                  ),
                  SizedBox(
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
                      IconButton(
                          onPressed: (){
                            setState(() {
                              _iscomment = true;
                            });
                          },
                          icon: Icon(_iscomment ? Icons.comment : Icons.comment_rounded),color: _iscomment ? AppColor.BlueColor :AppColor.BlackColor,
                      ),
                      IconButton(
                        onPressed: (){
                          setState(() {
                            _retwitte = true;
                          });
                        },
                        icon: Icon(_retwitte ? Icons.cloud : Icons.cloud_queue_outlined),color: _retwitte ? Colors.green :AppColor.BlackColor,
                      ),
                      IconButton(
                          onPressed: (){
                            setState(() {
                              _islike = true;
                            });
                          },
                          icon: Icon(_islike ? Icons.favorite : Icons.favorite_border_rounded),color: _islike ? Colors.red : AppColor.BlackColor,
                      ),
                      IconButton(
                        onPressed: (){
                          setState(() {
                            _share = true;
                          });
                        },
                        icon: Icon(_share ? Icons.download : Icons.download_done_outlined),color: _share ? AppColor.BlueColor : AppColor.BlackColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
