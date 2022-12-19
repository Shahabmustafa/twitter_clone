import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageUpdate extends StatefulWidget {
  const ImageUpdate({Key? key}) : super(key: key);

  @override
  State<ImageUpdate> createState() => _ImageUpdateState();
}

class _ImageUpdateState extends State<ImageUpdate> {
  final ImagePicker _imagePicker = ImagePicker();
  File? UploadImage;
  getImage(){

  }
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
              decoration: InputDecoration(
                hintText: "What's Happening?"
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Container(
              width: double.infinity,
              height: 200.0,
              color: Colors.grey,
              child: InkWell(
                onTap: (){

                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
