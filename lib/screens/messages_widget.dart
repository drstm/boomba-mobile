
import 'package:flutter/material.dart';
import 'package:boomba/cells/message_five_item_widget.dart';
import 'package:boomba/cells/message_four_item_widget.dart';
import 'package:boomba/cells/message_item_widget.dart';
import 'package:boomba/cells/message_six_item_widget.dart';
import 'package:boomba/cells/message_three_item_widget.dart';
import 'package:boomba/cells/message_two_item_widget.dart';
import 'package:boomba/cells/online_person_item_widget.dart';
import 'package:boomba/cells/online_person_three_item_widget.dart';
import 'package:boomba/cells/online_person_two_item_widget.dart';


class MessagesWidget extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Messages",
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 17,
            fontFamily: "Lato",
          ),
        ),
        automaticallyImplyLeading: false,
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
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 244, 242, 244),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 75,
              margin: EdgeInsets.only(left: 15, top: 74, right: 20),
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 75,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) => OnlinePersonItemWidget(),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(top: 12),
                child: ListView.builder(
                  itemCount: 15,
                  itemBuilder: (context, index) => MessageItemWidget(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}