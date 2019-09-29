import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class ScavengerWidget extends StatefulWidget {
  _ScavengerWidegetPageOne createState() => _ScavengerWidegetPageOne();
}

class _ScavengerWidegetPageOne extends State<ScavengerWidget> with TickerProviderStateMixin {

  Color hexToColor(String code) => Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  void onGroupPressed(BuildContext context) => Navigator.pop(context);

  AnimationController controller;
  Animation<double> animation;

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
            Align(
              alignment: Alignment.topCenter,
              child: FadeTransition(
                opacity: animation,
                child: Container(
                  margin: EdgeInsets.only(top: 89),
                  child: Text(
                    "Welcome!",
                    style: TextStyle(
                      color: hexToColor("#1b868c"),
                      fontSize: 42,
                      letterSpacing: -1,
                      fontFamily: "Lato",
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ),
            Align(
              alignment: Alignment.topCenter,
              child: FadeTransition(
                opacity: animation,
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    "Welcome to the HackNY-themed scavenger hunt!" + 
                    "\n\nA bunch of clues are waiting for you to discover the interior of the Institute of Mathematics building" +
                    "\n\nAre you ready? You may be able to hack, but are you able to think?",
                    style: TextStyle(
                      color: hexToColor("#1b868c"),
                      fontSize: 18,
                      fontFamily: "Lato",
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(height: 50.0,),
        color: hexToColor("#1b868c"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Increment Counter',
        child: Text("Start"),
      ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}