import 'package:bmi_calculater/ui/home.dart';
import 'package:bmi_calculater/ui/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "BMI",
    home: new Splash(),
    routes: <String, WidgetBuilder>{
      '/home': (BuildContext context) => new Home()
    },
  ));
}
