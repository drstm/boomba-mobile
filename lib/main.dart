
import 'package:flutter/material.dart';
import 'package:boomba/screens/welcome_widget.dart';

void main() => runApp(App());


class App extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
  
    return MaterialApp(
      home: WelcomeWidget(),
    );
  }
}