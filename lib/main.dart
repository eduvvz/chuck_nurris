import 'package:flutter/material.dart';
import 'package:chuck_nurris/pages/homePage.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Navigation',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}