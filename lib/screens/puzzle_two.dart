import 'package:flutter/material.dart';
import 'package:folding_cell/folding_cell.dart';

import 'camtest.dart';


class PuzzleTwo extends StatelessWidget {
  final _foldingCellKey = GlobalKey<SimpleFoldingCellState>();
  void onGroupPressed(BuildContext context) => Navigator.pop(context);
  Color hexToColor(String code) => Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  void onFABPress(BuildContext context) => Navigator.push(context, MaterialPageRoute(builder: (context) => CamTest(category: "Courant_paint",puzzle: "three")));
  
  @override
  Widget build(BuildContext context) {
  
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
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.311, 1.098),
            end: Alignment(0.689, -0.098),
            stops: [
              0,
              1,
            ],
            colors: [
              Color.fromARGB(255, 99, 114, 248),
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
                margin: EdgeInsets.only(top: 89),
                child: Text(
                  "Puzzle #2",
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
                  "You are in my house now\nYou can find me hanging around... Somewhere",
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 18,
                    fontFamily: "Lato",
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: SimpleFoldingCell(
                key: _foldingCellKey,
                frontWidget: _buildFrontWidget(),
                innerTopWidget: _buildInnerTopWidget(),
                innerBottomWidget: _buildInnerBottomWidget(),
                cellSize: Size(MediaQuery.of(context).size.width, 125),
                padding: EdgeInsets.all(15),
                animationDuration: Duration(milliseconds: 300),
                borderRadius: 10,
                onOpen: () => print('cell opened'),
                onClose: () => print('cell closed')),
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
        tooltip: 'Increment Counter',
        child: new Icon(Icons.chevron_right),
      ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildFrontWidget() {
    return Container(
      color: Color(0xFFffcd3c),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Here's a clue!",
              style: TextStyle(
                  color: Color(0xFF2e282a),
                  fontFamily: 'OpenSans',
                  fontSize: 20.0,
                  fontWeight: FontWeight.w800)),
          FlatButton(
            onPressed: () => _foldingCellKey?.currentState?.toggleFold(),
            child: Text(
              "Open",
            ),
            textColor: Colors.white,
            color: hexToColor("#1b868c"),
            splashColor: Colors.white.withOpacity(0.5),
          )
        ],
      )
    );
  }

  Widget _buildInnerTopWidget() {
    return Container(
      color: Color(0xFFff9234),
      alignment: Alignment.center,
      child: Text("I'm trapped in the first floor",
        style: TextStyle(
        color: Color(0xFF2e282a),
        fontFamily: 'OpenSans',
        fontSize: 20.0,
        fontWeight: FontWeight.w800)
      )
    );
  }

  Widget _buildInnerBottomWidget() {
    return Container(
      color: Color(0xFFecf2f9),
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: FlatButton(
          onPressed: () => _foldingCellKey?.currentState?.toggleFold(),
          child: Text(
            "Close",
          ),
          textColor: Colors.white,
          color: Colors.indigoAccent,
          splashColor: Colors.white.withOpacity(0.5),
        ),
      ),
    );
  }
}

