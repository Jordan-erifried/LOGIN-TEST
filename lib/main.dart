import 'package:competition/routes/naviagator.dart';
//import 'package:competition/views/homepage.dart';
import 'package:competition/views/principalhome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Competition",
      routes: NavApp.define(),
      home: HomeP(),
      debugShowCheckedModeBanner: false,
    );
  }
}
