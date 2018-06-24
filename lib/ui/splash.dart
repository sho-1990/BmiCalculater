import 'dart:async';

import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _SplashState();
  }
}

class _SplashState extends State<Splash> {

  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/home');
  }

  @override
  void initState() {
    super.initState();
    debugPrint("initState");
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: new Center(
        child: new Image.asset('images/bmilogo.png'),
      ),
    );
  }

}