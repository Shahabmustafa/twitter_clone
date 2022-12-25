import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:twitter_clone/Utls/app_colors.dart';
import 'package:twitter_clone/Widgets/post_share.dart';

class HomeNavigationBottom extends StatefulWidget {
  const HomeNavigationBottom({Key? key}) : super(key: key);

  @override
  State<HomeNavigationBottom> createState() => _HomeNavigationBottomState();
}

class _HomeNavigationBottomState extends State<HomeNavigationBottom> {
  // var time = DateTime.now();

  final _auth = FirebaseAuth.instance.currentUser;
  ValueNotifier<bool> _iscomment = ValueNotifier<bool>(true);
  ValueNotifier<bool> _islike = ValueNotifier<bool>(true);
  ValueNotifier<bool> _retwitte = ValueNotifier<bool>(true);
  ValueNotifier<bool> _share = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
              child: PostShare(),
            ),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('postShare').snapshots(),
              builder: (context,AsyncSnapshot<QuerySnapshot>snapshot){
                if(snapshot.hasData){
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context,index){
                        var data = snapshot.data!.docs[index];
                        return Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5.0),
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
                                        children:[Text("${_auth!.displayName}",style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0,),),
                                          const Icon(Icons.verified,color: AppColor.BlueColor,),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 40.0),
                                        child: Text(data['postShare']),
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
                                        child: Image.network('${data['imageUrl']}',fit: BoxFit.cover,)),
                                    const SizedBox(
                                    height: 10.0,
                                  ),
                                    Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      ValueListenableBuilder(
                                          valueListenable: _iscomment,
                                          builder: (context,value,child){
                                            return IconButton(
                                              onPressed: (){
                                                _iscomment.value =! _iscomment.value;
                                              },
                                              icon: Icon(_iscomment.value ? Icons.messenger_outline : Icons.message,color: Colors.blue,),
                                            );
                                          }),
                                      ValueListenableBuilder(
                                          valueListenable: _islike,
                                          builder: (context,child,value){
                                            return IconButton(
                                              onPressed: (){
                                                _islike.value =! _islike.value;
                                              },
                                              icon: Icon(_islike.value ? Icons.favorite_border_rounded : Icons.favorite,color: Colors.red,),
                                            );
                                          }),
                                      ValueListenableBuilder(
                                          valueListenable: _retwitte,
                                          builder: (context,child,value){
                                            return IconButton(
                                              onPressed: (){
                                                _retwitte.value =! _retwitte.value;
                                              },
                                              icon: Icon(_retwitte.value ? Icons.cloud_queue_outlined : Icons.cloud,color: Colors.green,),
                                            );
                                          }),
                                      ValueListenableBuilder(
                                          valueListenable: _share,
                                          builder: (context,child,value){
                                            return IconButton(
                                              onPressed: (){
                                                _share.value =! _share.value;
                                              },
                                              icon: Icon(_share.value ? Icons.upload_outlined : Icons.upload,color: Colors.blue,),
                                            );
                                          }),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                  );
                }else{
                  return CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
