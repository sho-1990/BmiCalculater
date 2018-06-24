import 'package:flutter/material.dart';
import 'dart:math';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {

  final TextEditingController _age          = new TextEditingController();
  final TextEditingController _heightInFeet = new TextEditingController();
  final TextEditingController _weightInLib  = new TextEditingController();

  double _bmi = 0.0;
  String _result = "";

  void _handleCalculate() {
    final String age = _age.text;
    final String height = _heightInFeet.text;
    final String weight = _weightInLib.text;
    setState(() {
      if (age.isEmpty || height.isEmpty || weight.isEmpty) {
        _bmi = 0.0;
        _result = "";
        return;
      }
      // todo check minus
      _bmi = calculateBmi(double.parse(age), double.parse(height) * 30.48, double.parse(weight) / 2.2046);
      if (_bmi > 25) {
        _result = "Overweight";
      } else if (_bmi < 18.5) {
        _result = "Underweight";
      } else {
        _result = "Normal";
      }
    });


  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("BMI"),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      backgroundColor: Colors.grey.shade50,
      body: new ListView(
        padding: const EdgeInsets.all(2.5),
        children: <Widget>[
          new Image.asset("images/bmilogo.png",
            height: 80.0,
            width: 200.0,),
          new Container(
            color: Colors.grey.shade300,
            margin: const EdgeInsets.all(3.0),
            alignment: Alignment.center,
            child: new Column(
              children: <Widget>[
                new TextField(
                  controller: _age,
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                    labelText: "Age",
                    hintText: "eg 6",
                    icon: new Icon(Icons.person_outline),
                  ),
                ),
                new TextField(
                  controller: _heightInFeet,
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                    labelText: "Height in feet",
                    icon: new Icon(Icons.assessment),
                  ),
                ),
                new TextField(
                  controller: _weightInLib,
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                    labelText: "Weight in lb",
                    icon: new Icon(Icons.line_weight),
                  ),
                ),
                new Padding(padding: new EdgeInsets.all(8.0)),
                new RaisedButton(
                  padding: new EdgeInsets.all(10.0),
                  onPressed: _handleCalculate,
                  color: Colors.pinkAccent,
                  disabledColor: Colors.pinkAccent,
                  child: new Text("Calculate",),
                  textColor: Colors.white,
                ),
                new Padding(padding: new EdgeInsets.all(4.0)),
              ],
            ),
          ),
          new Center(
            child:
              new Text(_bmi > 0 ? "Your BIM: ${_bmi.toStringAsFixed(1)}" : "Please input your info",
                style: new TextStyle(
                  color: Colors.blue,
                  fontSize: 24.9,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500,
                ),
              ),
          ),
          new Padding(padding: new EdgeInsets.all(5.0)),
          new Center(
            child:
              new Text(_result,
                style: new TextStyle(
                  color: Colors.pinkAccent.shade200,
                  fontSize: 24.9,
                  fontWeight: FontWeight.w500,
                ),
              ),
          )

        ],

      ),
    );
  }

  double calculateBmi(double age, double height, double weight) {
    double result;
    if (age < 6) {
      result = weight / pow(height, 2) * pow(10, 4);
    } else if (age < 14) {
      result = weight / pow(height, 3) * pow(10, 7);
    } else {
      result = weight / pow(height, 2);
    }
    debugPrint(result.toString());
    return (result * 10000);
  }

}