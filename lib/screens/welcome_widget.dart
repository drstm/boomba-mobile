
import 'package:flutter/material.dart';
import 'package:boomba/screens/login_widget.dart';
import 'package:boomba/screens/signup_widget.dart';
import 'package:boomba/widgets/logo_image.dart';
import 'package:flutter/animation.dart';


class WelcomeWidget extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() => _WelcomeWidgetState();
}


class _WelcomeWidgetState extends State<WelcomeWidget> with SingleTickerProviderStateMixin {
  AnimationController logoImageAnimationController;
  
  @override
  void initState() {
  
    super.initState();
    this.logoImageAnimationController = AnimationController(duration: Duration(milliseconds: 1000), vsync: this);
    this.startAnimationOne();
  }
  
  @override
  void dispose() {
  
    super.dispose();
    this.logoImageAnimationController.dispose();
  }
  
  void onSignUpPressed(BuildContext context) => Navigator.push(context, MaterialPageRoute(builder: (context) => SignupWidget()));
  
  void onLogInPressed(BuildContext context) => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginWidget()));
  
  void startAnimationOne() => this.logoImageAnimationController.forward();
  
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
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
                width: 120,
                height: 120,
                margin: EdgeInsets.only(top: 100),
                child: logoImage(
                  logoImageAnimationController: this.logoImageAnimationController,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: 60),
                child: Text(
                  "Boomba",
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
                  "Play",
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 18,
                    fontFamily: "Lato",
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Spacer(),
            Container(
              height: 60,
              margin: EdgeInsets.only(left: 30, right: 30, bottom: 123),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 148,
                    height: 60,
                    child: FlatButton.icon(
                      icon: Image.asset("assets/images/icon-sign-up.png",),
                      label: Text(
                        "SIGN UP",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Lato",
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      onPressed: () => this.onSignUpPressed(context),
                      color: Color.fromARGB(255, 255, 255, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(2)),
                      ),
                      textColor: Color.fromARGB(255, 99, 114, 248),
                      padding: EdgeInsets.all(0),
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: 148,
                    height: 60,
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
                      onPressed: () => this.onLogInPressed(context),
                      color: Color.fromARGB(255, 255, 255, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(2)),
                        side: BorderSide(
                          width: 2,
                          color: Color.fromARGB(255, 0, 0, 0),
                          style: BorderStyle.solid,
                        ),
                      ),
                      textColor: Color.fromARGB(255, 99, 114, 248),
                      padding: EdgeInsets.all(0),
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