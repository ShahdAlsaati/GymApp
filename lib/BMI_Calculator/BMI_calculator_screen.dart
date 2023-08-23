import 'dart:math';


import 'package:flutter/material.dart';
import 'package:gym/style/colors.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

import 'BMI_score.dart';
import 'BMI_widget/age_weight_widget.dart';
import 'BMI_widget/gender_widget.dart';
import 'BMI_widget/height_widget.dart';

class BMICalculator extends StatefulWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  int _gender = 0;
  int _height = 150;
  int _age = 30;
  int _weight = 50;
  bool _isFinished = false;
  double _bmiScore = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageColor,
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.brown
          ),
          backgroundColor: Colors.orangeAccent,
          centerTitle: true,
          title: const Text("BMI Calculator",
          style: TextStyle(
            color: Colors.brown
          ),),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: pageColor,
            padding: const EdgeInsets.all(12),
            child: Card(
              color: pageColor,

              elevation: 12,
              shape: const RoundedRectangleBorder(),
              child: Column(

                children: [
                  SizedBox(height: 30,),
                  //Lets create widget for gender selection
                  GenderWidget(
                    onChange: (genderVal) {
                      _gender = genderVal;
                    },
                  ),
                  SizedBox(height: 30,),
                  HeightWidget(
                    onChange: (heightVal) {
                      _height = heightVal;
                    },
                  ),
                  SizedBox(height: 60,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AgeWeightWidget(
                          onChange: (ageVal) {
                            _age = ageVal;
                          },
                          title: "Age",
                          initValue: 30,
                          min: 0,
                          max: 100),
                      AgeWeightWidget(
                          onChange: (weightVal) {
                            _weight = weightVal;
                          },
                          title: "Weight(Kg)",
                          initValue: 50,
                          min: 0,
                          max: 200)
                    ],
                  ),
                  SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 60),
                    child: SwipeableButtonView(

                        isFinished: _isFinished,
                        onFinish: () async {
                          await Navigator.push(
                              context,
                              PageTransition(
                                  child: ScoreScreen(
                                    bmiScore: _bmiScore,
                                    age: _age,
                                  ),
                                  type: PageTransitionType.fade));

                          setState(() {
                            _isFinished = false;
                          });
                        },
                        onWaitingProcess: () {
                          //Calculate BMI here
                          calculateBmi();

                          Future.delayed(Duration(seconds: 1), () {
                            setState(() {
                              _isFinished = true;
                            });
                          });
                        },
                        activeColor: Colors.orange,
                        buttonWidget: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.black,
                        ),
                        buttonText: "CALCULATE"),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  void calculateBmi() {
    _bmiScore = _weight / pow(_height / 100, 2);
  }
}