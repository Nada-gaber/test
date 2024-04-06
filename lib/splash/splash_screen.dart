import 'dart:async';
import 'package:flutter/material.dart';
import 'package:test/core/constants/colors.dart';
import 'package:test/home_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 7), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => MyHomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Container(
        
        height: MediaQuery.of(context).size.height,
        child: Image.asset('assests/spaceX.gif',fit: BoxFit.fitHeight,),
      ),
    );
  }
}
