import 'dart:async';

import 'package:competition/colors/color.dart';
import 'package:competition/views/homepage.dart';
import 'package:flutter/material.dart';

class HomeP extends StatefulWidget {
  @override
  _HomePState createState() => _HomePState();
}

class _HomePState extends State<HomeP> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(milliseconds: 4000), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [purple, purpleLight],
                end: Alignment.topCenter,
                begin: Alignment.bottomCenter)),
        child: Center(
          child: Image.asset("assets/logo.png"),
        ),
      ),
    );
  }
}
