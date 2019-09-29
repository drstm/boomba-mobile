import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

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
      final String endpoint = "https://a0040ba9.ngrok.io/check";
      String base64Image = base64Encode(image.readAsBytesSync());
      String fileName = image.path.split("/").last;
      print(fileName);
      http.post(endpoint, body: {
        "image": base64Image,
        "name": fileName,
        "category": "Courant_paint"
      }).then((res) {
        print(res.statusCode);
      }).catchError((err) {
        print(err);
      });
    } else {
      image = await ImagePicker.pickImage(source: ImageSource.gallery);
    }
    setState(() {
      _image = image;
    });
  }

  // uploadFile() async {
  //   var postUri = Uri.parse("<APIUrl>");
  //   var request = new http.MultipartRequest("POST", postUri);
  //   request.fields['user'] = 'blah';
  //   request.files.add(new http.MultipartFile.fromBytes('file', await File.fromUri("<path/to/file").readAsBytes(), contentType: new MediaType('image', 'jpeg')))

  //   request.send().then((response) {
  //     if (response.statusCode == 200) print("Uploaded!");
  //   });
  // }

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