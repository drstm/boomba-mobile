import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class CamTest extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _CamTest();
  }
}

class _CamTest extends State<CamTest> {
  Color hexToColor(String code) => Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);

  File _image;
  Future getImage(bool isCamera) async {
    File image;
    if (isCamera){
      image = await ImagePicker.pickImage(source: ImageSource.camera);
      print(image.path);
    } else {
      image = await ImagePicker.pickImage(source: ImageSource.gallery);
    }
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: hexToColor("#1b868c")
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.insert_drive_file),
              onPressed: () {
                getImage(false);
              },
            ),
            SizedBox(height: 10.0,),
            IconButton(
              icon: Icon(Icons.camera_alt),
              onPressed: () {
                getImage(true);
              },
            ),
            _image == null? Container() : Image.file(_image, height: 300.0, width: 300.0,)
          ],
        ),
      ),
    );
  }

}