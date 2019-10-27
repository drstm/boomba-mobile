import 'package:boomba/screens/puzzle_four.dart';
import 'package:boomba/screens/show_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class ScavengerExplain3 extends StatefulWidget {
  _ScavengerExplain3 createState() => _ScavengerExplain3();
}

class _ScavengerExplain3 extends State<ScavengerExplain3> with TickerProviderStateMixin {

  Color hexToColor(String code) => Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  void onGroupPressed(BuildContext context) => Navigator.pop(context);
  void onFABPress(BuildContext context) => Navigator.push(context, MaterialPageRoute(builder: (context) => PuzzleFour()));

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
                    'BOOMBA!',
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
            ShowUp(
              delay: delayAmount,
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: EdgeInsets.only(top: 50),
                  child: Text(
                    'Congrats! \n Puzzle #3 completed',
                    style: TextStyle(
                      color: hexToColor("#1b868c"),
                      fontSize: 34,
                      letterSpacing: -1,
                      fontFamily: "Lato",
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              ),
            ),
            ShowUp(
              delay: delayAmount,
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: EdgeInsets.only(top: 40),
                  child: Text(
                    'James J. Stoker was a mathematician and engineer, director and co-founder of the Courant Institute of Mathematics. \n One of his many contributions was defining the mathematical theory behind water waves. Next time you Surf, he will be watching...',
                    style: TextStyle(
                      color: hexToColor("#1b868c"),
                      fontSize: 20,
                      letterSpacing: -1,
                      fontFamily: "Lato",
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              ),
            ),
            Spacer(),
      //       ShowUp(
      //         delay: delayAmount + 100,
      //         child: Image.network(randomGif)
      //       )
           ],
         ),
       ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(height: 50.0,),
        color: hexToColor("#1b868c"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => this.onFABPress(context),
        child: Text("Next"),
      ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}