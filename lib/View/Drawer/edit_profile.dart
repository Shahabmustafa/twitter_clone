import 'dart:ffi';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:twitter_clone/Widgets/social_button.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final ImagePicker _imagePicker = ImagePicker();
  File? file;
  File? backgroundFile;

  getImage()async{
    var img = await _imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      file = File(img!.path);
    });
  }

  getBackgroundImage()async{
    var img = await _imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      backgroundFile = File(img!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                InkWell(
                  onTap: (){
                    getBackgroundImage();
                  },
                  child: Container(
                    width: double.infinity,
                        height: 200.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: backgroundFile == null ? AssetImage('images/twitter.png') : FileImage(File(backgroundFile!.path)) as ImageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Icon(Icons.camera_alt,color: Colors.white,),
                      ),
                ),
                Positioned(
                  left: 10.0,
                  bottom: -50.0,
                  child: Container(
                      child: CircleAvatar(
                        radius: 50.0,
                        backgroundImage: file == null ? AssetImage('images/twitter.png') : FileImage(File(file!.path)) as ImageProvider,
                        child: IconButton(
                          onPressed: (){
                            getImage();
                          },
                          icon: Icon(Icons.camera_alt),
                        ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: TwitterButton(
                  onTap: (){
                    Navigator.pop(context);
                  },
                title: 'Save',
              ),
            )

          ],
        ),
      ),
    );
  }
}
