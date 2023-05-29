import 'dart:async';
import 'package:drug_addiction/constants.dart';
import 'package:drug_addiction/core/constants/colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 2),
        () => Navigator.pushReplacementNamed(context, 'login'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backGroundColor,
        body: Center(
            child: Image.asset(
          logo,
          color: whiteColor,
        )));
  }
}
