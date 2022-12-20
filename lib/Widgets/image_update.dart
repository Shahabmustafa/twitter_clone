import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:twitter_clone/Widgets/social_button.dart';

class ImageUpdate extends StatefulWidget {
  const ImageUpdate({Key? key}) : super(key: key);

  @override
  State<ImageUpdate> createState() => _ImageUpdateState();
}

class _ImageUpdateState extends State<ImageUpdate> {
  final ImagePicker _imagePicker = ImagePicker();
  final TextEditingController _searchPostController = TextEditingController();
  File? UploadImage;
  String URL = "";

  getImage()async{
    var image = await _imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      UploadImage = File(image!.path);
    });
  }

  addFile()async{
    String name = DateTime.now().isUtc.toString();
    var postImage = FirebaseStorage.instance.ref().child(name);
    UploadTask task = postImage.putFile(UploadImage!);
    TaskSnapshot snapshot = await task;
    URL = await snapshot.ref.getDownloadURL();
  }

  var addImageFirestore = FirebaseFirestore.instance.collection('postShare');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Pick'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
        child: Column(
          children: [
            TextFormField(
              controller: _searchPostController,
              decoration: const InputDecoration(
                hintText: "What's Happening?"
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            Container(
              width: double.infinity,
              height: 200.0,
              decoration: BoxDecoration(
                color: Colors.grey,
                image: DecorationImage(
                  image: UploadImage == null ? AssetImage("images/twitter.png") : FileImage(File(UploadImage!.path)) as ImageProvider,
                  fit: BoxFit.cover
                )
              ),
              child: InkWell(
                onTap: (){
                  getImage();
                  }
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            TwitterButton(
                onTap: ()async{
                  await addFile();
                  addImageFirestore.add({
                   "postShare" : _searchPostController.text.toString(),
                    "imageUrl" : URL.toString(),
                  });
                  Navigator.pop(context);
                },
              title: 'Post Upload'),
          ],
        ),
      ),
    );
  }
}
