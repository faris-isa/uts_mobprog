import 'dart:async';
import 'package:flutter/material.dart';
import 'main_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
  var duration = const Duration(seconds: 5);
  return Timer(duration, () {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => MainScreen()));
  });
}

@override
Widget build(BuildContext context) {
  return Center(
    child: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          alignment: Alignment.center,
          image: AssetImage('assets/images/splash.jpg')
        )
      ),
      child: const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 6.0, bottom: 18.0),
            child: DefaultTextStyle(
              style: TextStyle(
                color: Colors.white,
                fontSize: 72,
                fontFamily: 'PlusJakartaSans',
                fontWeight: FontWeight.bold,
              ),
              child: Text('DOTA 2 : Heroes')
            ),
          ),
        ),
    )
  );
 }
}