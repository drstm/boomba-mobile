import 'package:boomba/screens/show_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class ScavengerSad extends StatefulWidget {
  _ScavengerSad createState() => _ScavengerSad();
}

class _ScavengerSad extends State<ScavengerSad> with TickerProviderStateMixin {
  static List<String> gifArray = ['http://giphygifs.s3.amazonaws.com/media/t9X2fFy8QOT1S/giphy.gif', 'https://media.giphy.com/media/4560Nv2656Gv0Lvp9F/giphy.gif','https://media.giphy.com/media/FzyRvxMNDLQZi/giphy.gif','https://media.giphy.com/media/VDHCwU6culRHFTXt1y/giphy.gif']; 
  var randomGif = (gifArray.toList()..shuffle()).first;
  static List<String> textArray = ['Oh ño! Try again', 'Nice try... But no','No worries, try again!']; 
  var txt = (textArray.toList()..shuffle()).first;

  Color hexToColor(String code) => Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  void onGroupPressed(BuildContext context) => Navigator.pop(context);

  AnimationController controller;
  Animation<double> animation;

  int delayAmount = 500;

  initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 1500), 
      vsync: this
    );
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.forward();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => this.onGroupPressed(context),
          icon: Image.asset("assets/images/group-2.png",),
        ),
        backgroundColor: hexToColor("#1b868c"),
        elevation: 0,
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        // color: hexToColor("#1b868c"),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ShowUp(
              delay: delayAmount,
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: EdgeInsets.only(top: 89),
                  child: Text(
                    txt,
                    style: TextStyle(
                      color: hexToColor("#1b868c"),
                      fontSize: 42,
                      letterSpacing: -1,
                      fontFamily: "Lato",
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              ),
            ),
            // Spacer(),
            ShowUp(
              delay: delayAmount + 100,
              child: Image.network(randomGif)
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(height: 50.0,),
        color: hexToColor("#1b868c"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => this.onGroupPressed(context),
        child: Text("Retry"),
      ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}