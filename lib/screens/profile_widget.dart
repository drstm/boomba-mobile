
import 'package:boomba/screens/scavenger_start.dart';
import 'package:flutter/material.dart';
import 'package:boomba/screens/profile_settings_widget.dart';


class ProfileWidget extends StatelessWidget {
  
  void onLeftItemPressed(BuildContext context) => Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileSettingsWidget()));
  Color hexToColor(String code) => Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  void HackNYScavenger(BuildContext context) => Navigator.push(context, MaterialPageRoute(builder: (context) => ScavengerWidget()));

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: hexToColor("#1b868c"),
        title: Text(
          "Scavenger Hunts",
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 17,
            fontFamily: "Lato",
          ),
        ),
        automaticallyImplyLeading: false,
        actions: [
          FlatButton(
            onPressed: () => this.onLeftItemPressed(context),
            textColor: Color.fromARGB(255, 255, 255, 255),
            child: new Icon(Icons.settings)
          ),
        ]
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
              hexToColor("#6271F7"),
              hexToColor("#1B878C"),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Divider(color: Colors.black, height: 1),
            Container(
              height: 320,
               margin: EdgeInsets.only(top: 20),
              //decoration: BoxDecoration(
                //color: Color.fromARGB(255, 255, 255, 255),
              //),
              child: Column(
                children: [
                  Container(
                    width: 124,
                    height: 124,
                    margin: EdgeInsets.only(top: 20),
                    child: Image.asset(
                      "assets/images/hackny_logo_small.png",
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 11),
                    child: Text(
                      "HackNY at NYU Courant",
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 26,
                        fontFamily: "Lato",
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: 150,
                    margin: EdgeInsets.only(bottom: 20),
                    child: FlatButton.icon(
                      //color: hexToColor("#1b868c"),
                      icon: Icon(Icons.play_circle_outline), //`Icon` to display
                      label: Text('Begin',
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 18,
                        fontFamily: "Lato",
                      ),
                      ),
                      textColor: Color.fromARGB(255, 255, 255, 255),
                      onPressed: () => this.HackNYScavenger(context)
                    ),
                  ),
                ],
              ),
            ),
            Divider(color: Colors.black, height: 5),
            Container(
              height: 30,
              // decoration: BoxDecoration(
              //   color: hexToColor("#1b868c")
              // ),
            ),
            Container(
              height: 320,
              margin: EdgeInsets.only(top: 20),
              // decoration: BoxDecoration(
              //   color: Color.fromARGB(255, 255, 255, 255),
              // ),
              child: Column(
                children: [
                  Container(
                    width: 124,
                    height: 124,
                    margin: EdgeInsets.only(top: 20),
                    child: Image.asset(
                      "assets/images/wsp_small.png",
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 11),
                    child: Text(
                      "Washington Square Park at NYU",
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 26,
                        fontFamily: "Lato",
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: 150,
                    margin: EdgeInsets.only(bottom: 20),
                    child: FlatButton.icon(
                      // color: hexToColor("#1b868c"),
                      icon: Icon(Icons.play_circle_outline), //`Icon` to display
                      label: Text('Begin',
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 18,
                        fontFamily: "Lato",
                      ),
                      ),
                      textColor: Color.fromARGB(255, 255, 255, 255),
                      onPressed: () {
                        //Code to execute when Floating Action Button is clicked
                        //...
                      },
                    ),
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