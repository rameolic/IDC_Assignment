
import 'package:flutter/material.dart';
import 'UI/Landingpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IDC Assignment By Ram',
      theme: ThemeData(primarySwatch: Colors.blue,),
      home: LandingPage(),
    );
  }
}





