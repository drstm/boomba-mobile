import 'package:boomba/screens/profile_widget.dart';
import 'package:boomba/screens/show_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class ScavengerExplain4 extends StatefulWidget {
  _ScavengerExplain4 createState() => _ScavengerExplain4();
}

class _ScavengerExplain4 extends State<ScavengerExplain4> with TickerProviderStateMixin {
  static List<String> gifArray = ['https://media.giphy.com/media/3oEdv6thH4aJHVcs6c/giphy.gif'];
  var randomGif = (gifArray.toList()..shuffle()).first;
  Color hexToColor(String code) => Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  void onGroupPressed(BuildContext context) => Navigator.pop(context);
  void onFABPress(BuildContext context) => Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileWidget()));

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
                  margin: EdgeInsets.only(top: 30),
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
                  margin: EdgeInsets.only(top: 0),
                  child: Text(
                    'Congrats! \n You made it until the end!',
                    style: TextStyle(
                      color: hexToColor("#1b868c"),
                      fontSize: 28,
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
                  margin: EdgeInsets.only(top: 28),
                  child: Text(
                    'Thanks for playing!',
                    style: TextStyle(
                      color: hexToColor("#1b868c"),
                      fontSize: 24,
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
        onPressed: () => this.onFABPress(context),
        child: Text("Finish"),
      ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}