import 'dart:async';
import 'dart:convert';

import 'package:boomba/screens/puzzle_two.dart';
import 'package:boomba/screens/scavenger_happy.dart';
import 'package:boomba/screens/scavenger_sad.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class CamTest extends StatefulWidget {
  final String category;
  final String puzzle;
  CamTest({@required this.category, this.puzzle});
  @override
  State<StatefulWidget> createState() {
    return _CamTest();
  }
}

class _CamTest extends State<CamTest> {
  Color hexToColor(String code) => Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  void onSuccess(BuildContext context) => Navigator.push(context, MaterialPageRoute(builder: (context) => ScavengerHappyWidget(nextEpisode: widget.puzzle,)));
  void onFailure(BuildContext context) => Navigator.push(context, MaterialPageRoute(builder: (context) => ScavengerSad())); 

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
        "category": widget.category
      }).then((res) {
        // print(res.body);
        var response = json.decode(res.body);
        if (response['status'] == 'true') {
          onSuccess(context);
        } else {
          onFailure(context);
        };
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
        backgroundColor: hexToColor("#1b868c"),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.311, 1.098),
            end: Alignment(0.689, -0.098),
            stops: [
              0,
              1,
            ],
            colors: [
              Color.fromARGB(255, 99, 114, 248),
              Color.fromARGB(255, 28, 135, 140),
            ],
          ),
        ),
        child: Column(
          children: <Widget>[
            Text(
              "Submit a photo of the right answer!",
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 42,
                letterSpacing: -1,
                fontFamily: "Lato",
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            _image == null? Container() : Image.file(_image, height: 300.0, width: 300.0,)
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(height: 50.0,),
        color: hexToColor("#1b868c"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => getImage(true),
        tooltip: 'Increment Counter',
        child: new Icon(Icons.camera_alt),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );  
  }
}