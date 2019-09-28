
import 'package:flutter/material.dart';


class MessageItemWidget extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
  
    return Container(
      constraints: BoxConstraints.expand(height: 80),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      child: Row(
        children: [
          Container(
            width: 62,
            height: 62,
            margin: EdgeInsets.only(left: 14),
            child: Image.asset(
              "assets/images/avatar-temp-4.png",
              fit: BoxFit.none,
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: 243,
              height: 35,
              margin: EdgeInsets.only(left: 9, top: 23),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Vulcan",
                      style: TextStyle(
                        color: Color.fromARGB(255, 217, 104, 111),
                        fontSize: 16,
                        fontFamily: "Lato",
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(top: 4),
                      child: Text(
                        "The needs of the few outweight the needs of the many.",
                        style: TextStyle(
                          color: Color.fromARGB(255, 148, 148, 148),
                          fontSize: 10,
                          fontFamily: "Lato",
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          Container(
            width: 7,
            height: 13,
            margin: EdgeInsets.only(right: 20),
            child: Image.asset(
              "assets/images/path-2.png",
              fit: BoxFit.none,
            ),
          ),
        ],
      ),
    );
  }
}