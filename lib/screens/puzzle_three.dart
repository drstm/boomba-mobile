
import 'package:flutter/material.dart';
import 'package:folding_cell/folding_cell.dart';


class PuzzleThree extends StatelessWidget {
  final _foldingCellKey = GlobalKey<SimpleFoldingCellState>();
  void onGroupPressed(BuildContext context) => Navigator.pop(context);
  Color hexToColor(String code) => Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  
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
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  "Puzzle #3",
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
                width: 200.0,
                child: Image.asset('assets/images/stoker.jpeg')
                  ),
                ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  "Who is he?",
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
                cellSize: Size(MediaQuery.of(context).size.width, 100),
                padding: EdgeInsets.all(10),
                animationDuration: Duration(milliseconds: 300),
                borderRadius: 5,
                onOpen: () => print('cell opened'),
                onClose: () => print('cell closed')),
              ),
              Align(
              alignment: Alignment.topCenter,
              child: Container(
                // margin: EdgeInsets.only(top: 20),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Key',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(height: 30.0,),
        color: hexToColor("#1b868c"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Increment Counter',
        child: Text("Submit"),
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
      child: Text("You might need to look upstairs.",
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