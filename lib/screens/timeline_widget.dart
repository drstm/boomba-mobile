
import 'package:flutter/material.dart';


class TimelineWidget extends StatelessWidget {
  
  void onItemPressed(BuildContext context) {
  
  }
  
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "What's up?",
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 17,
            fontFamily: "Lato",
          ),
        ),
        leading: FlatButton(
          onPressed: () => this.onItemPressed(context),
          textColor: Color.fromARGB(255, 255, 255, 255),
          child: Text(
            "Item",
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 12,
              fontFamily: "",
            ),
            textAlign: TextAlign.left,
          ),
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
                Color.fromARGB(255, 98, 113, 248),
                Color.fromARGB(255, 28, 135, 140),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 244, 242, 244),
        ),
        child: Container(),
      ),
    );
  }
}