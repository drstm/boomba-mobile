import 'package:boomba/screens/puzzle_four.dart';
import 'package:boomba/screens/puzzle_three.dart';
import 'package:boomba/screens/puzzle_two.dart';
import 'package:boomba/screens/scavenger_expl1.dart';
import 'package:boomba/screens/scavenger_expl2.dart';
import 'package:boomba/screens/scavenger_expl3.dart';
import 'package:boomba/screens/scavenger_expl4.dart';
import 'package:boomba/screens/show_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class ScavengerHappyWidget extends StatefulWidget {
  final String nextEpisode;
  ScavengerHappyWidget({@required this.nextEpisode});
  _ScavengerHappy createState() => _ScavengerHappy();
}

class _ScavengerHappy extends State<ScavengerHappyWidget> with TickerProviderStateMixin {
  static List<String> gifArray = ['https://media.giphy.com/media/3oxHQEESAwCqXinNIc/source.gif', 'https://media.giphy.com/media/VdQmSNvWvrvLZsbZkE/source.gif']; 
  var randomGif = (gifArray.toList()..shuffle()).first;

  Color hexToColor(String code) => Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  void onGroupPressed(BuildContext context) => Navigator.pop(context);
  void onFABPress(BuildContext context) {
    if (widget.nextEpisode == "two"){
      Navigator.push(context, MaterialPageRoute(builder: (context) => ScavengerExplain1()));
    } else if (widget.nextEpisode == "three") {
      Navigator.push(context, MaterialPageRoute(builder: (context) => ScavengerExplain2()));
    } else if (widget.nextEpisode == "four"){
      Navigator.push(context, MaterialPageRoute(builder: (context) => ScavengerExplain3()));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => ScavengerExplain4()));
    }
  }

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
                    "Yaas",
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
              delay: delayAmount + 200,
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
        onPressed: () => onFABPress(context),
        child: Text("Next"),
      ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}