
import 'package:boomba/screens/camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

Color hexToColor(String code) => Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
final cameras =  availableCameras();
final firstCamera = cameras.toString();

class TakePictureScreen extends StatefulWidget {
  final CameraDescription camera;

  const TakePictureScreen({
    Key key,
     this.camera,
  }) : 
    super(key: key);

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  // Add two variables to the state class to store the CameraController and
  // the Future.
  CameraController _controller;
  Future<void> _initializeControllerFuture;

  
  @override
  void initState() {
    super.initState();
    // To display the current output from the camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

 void onGroupPressed(BuildContext context) => Navigator.pop(context);
  
  void onLeftItemPressed(BuildContext context) {
  
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: hexToColor("#1b868c"),
        title: Text(
          "Check clue",
          style: TextStyle(
            //color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 17,
            fontFamily: "Lato",
          ),
        ),
        leading: IconButton(
          onPressed: () => this.onGroupPressed(context),
          icon: Image.asset("assets/images/group-2.png",),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(-0.014, 0.515),
              end: Alignment(1.014, 0.485),
              stops: [
                0,
                1,
              ],
              colors: [
                hexToColor("#1b868c"),
                hexToColor("#1b868c"),
              ],
            ),
          ),
        ),
        actions: [
          FlatButton(
            onPressed: () => this.onLeftItemPressed(context),
            textColor: Color.fromARGB(255, 255, 255, 255),
            child: new Icon(Icons.switch_camera)
          ),
        ]
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 244, 242, 244),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              left: 0,
              top: 0,
              right: 0,
              bottom: 0,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    right: 0,
                    bottom: 0,
                    child: CameraPreview(_controller)
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: 95,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Positioned(
                            left: 0,
                            top: 15,
                            right: 0,
                            child: Container(
                              height: 80,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                              child: Container(),
                            ),
                          ),
                          Positioned(
                            left: 9,
                            top: -1,
                            right: 20,
                            child: Container(
                              height: 82,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      width: 82,
                                      height: 82,
                                      child: Image.asset(
                                        "assets/images/avatar-2.png",
                                        fit: BoxFit.none,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      width: 122,
                                      height: 51,
                                      margin: EdgeInsets.only(left: 8, top: 25),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        children: [
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              "Guess who’s back?",
                                              style: TextStyle(
                                                color: Color.fromARGB(255, 15, 15, 15),
                                                fontSize: 14,
                                                fontFamily: "Lato",
                                                fontWeight: FontWeight.w700,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Container(
                                              margin: EdgeInsets.only(top: 3),
                                              child: Text(
                                                "Happening in 20h, Bajkonur",
                                                style: TextStyle(
                                                  color: Color.fromARGB(255, 0, 0, 0),
                                                  fontSize: 10,
                                                  fontFamily: "Lato",
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Container(
                                              margin: EdgeInsets.only(top: 7),
                                              child: Opacity(
                                                opacity: 0.4,
                                                child: Text(
                                                  "Event posted by Laika",
                                                  style: TextStyle(
                                                    color: Color.fromARGB(255, 0, 0, 0),
                                                    fontSize: 10,
                                                    fontFamily: "Lato",
                                                  ),
                                                  textAlign: TextAlign.left,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      width: 48,
                                      height: 48,
                                      margin: EdgeInsets.only(top: 28),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        children: [
                                          Container(
                                            height: 29,
                                            margin: EdgeInsets.symmetric(horizontal: 10),
                                            child: Image.asset(
                                              "assets/images/group.png",
                                              fit: BoxFit.none,
                                            ),
                                          ),
                                          Spacer(),
                                          Text(
                                            "Coming",
                                            style: TextStyle(
                                              color: Color.fromARGB(255, 140, 28, 140),
                                              fontSize: 14,
                                              fontFamily: "Lato",
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              child: Container(
                width: 185,
                height: 185,
                child: Image.asset(
                  "assets/images/icon-event-area.png",
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}