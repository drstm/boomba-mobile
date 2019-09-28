
import 'package:flutter/material.dart';
import 'package:boomba/cells/title_item_widget.dart';
import 'package:boomba/cells/title_two_item_widget.dart';
import 'package:boomba/cells/view_eight_item_widget.dart';
import 'package:boomba/cells/view_five_item_widget.dart';
import 'package:boomba/cells/view_four_item_widget.dart';
import 'package:boomba/cells/view_seven_item_widget.dart';
import 'package:boomba/cells/view_six_item_widget.dart';


class ProfilePhotosWidget extends StatelessWidget {
  
  void onGroupPressed(BuildContext context) => Navigator.pop(context);
  
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Dr. When photos",
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
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
                Color.fromARGB(255, 248, 132, 98),
                Color.fromARGB(255, 140, 28, 140),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 244, 242, 244),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(top: 73),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 375,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) => TitleItemWidget(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}