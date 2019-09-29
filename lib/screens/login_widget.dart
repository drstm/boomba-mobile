
import 'package:boomba/screens/scavenger_expl4.dart';
import 'package:boomba/screens/puzzle_three.dart';
import 'package:boomba/screens/puzzle_four.dart';
import 'package:flutter/material.dart';
import 'package:boomba/screens/tab_bar_widget.dart';
import 'package:boomba/screens/profile_widget.dart';



class LoginWidget extends StatelessWidget {
  
  void onLoginPressed(BuildContext context) => Navigator.push(context, MaterialPageRoute(builder: (context) => PuzzleThree()));
  
  void onForgotYourPasswordPressed(BuildContext context) {
  
  }
  
  void onGroupPressed(BuildContext context) => Navigator.pop(context);
  
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: hexToColor("#1b868c")
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
              Color.fromARGB(255, 98, 113, 248),
              Color.fromARGB(255, 28, 135, 140),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: 114),
                child: Text(
                  "Log in",
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 42,
                    letterSpacing: -1,
                    fontFamily: "Lato",
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  "Welcome back.",
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 18,
                    fontFamily: "Lato",
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              height: 101,
              margin: EdgeInsets.only(left: 20, top: 92, right: 20),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(51, 0, 0, 0),
                    offset: Offset(0, 20),
                    blurRadius: 25,
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(2)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 20,
                    margin: EdgeInsets.only(left: 15, top: 14, right: 15),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Your nickname",
                        contentPadding: EdgeInsets.all(0),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 15,
                        fontFamily: "Lato",
                      ),
                      maxLines: 1,
                      autocorrect: false,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    child: Opacity(
                      opacity: 0.1,
                      child: Container(
                        height: 1,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                        child: Container(),
                      ),
                    ),
                  ),
                  Container(
                    height: 20,
                    margin: EdgeInsets.only(left: 15, top: 14, right: 15),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Your password",
                        contentPadding: EdgeInsets.all(0),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 15,
                        fontFamily: "Lato",
                      ),
                      obscureText: true,
                      maxLines: 1,
                      autocorrect: false,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
              height: 60,
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 11),
              child: FlatButton.icon(
                icon: Image.asset("assets/images/icon-log-in.png",),
                label: Text(
                  "LOG IN",
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: "Lato",
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                onPressed: () => this.onLoginPressed(context),
                color: Color.fromARGB(255, 255, 255, 255),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                  side: BorderSide(
                    width: 2,
                    color: Color.fromARGB(255, 99, 114, 248),
                    style: BorderStyle.solid,
                  ),
                ),
                textColor: Color.fromARGB(255, 99, 114, 248),
                padding: EdgeInsets.all(0),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 150,
                height: 18,
                margin: EdgeInsets.only(bottom: 19),
                child: FlatButton(
                  onPressed: () => this.onForgotYourPasswordPressed(context),
                  color: Colors.transparent,
                  textColor: Color.fromARGB(255, 255, 255, 255),
                  padding: EdgeInsets.all(0),
                  child: Text(
                    "Reset password?",
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Lato",
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}