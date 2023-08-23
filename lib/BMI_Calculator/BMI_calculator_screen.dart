import 'dart:math';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:our_gym/BMI_Calculator/controller.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'BMI_score.dart';
import 'BMI_widget/age_weight_widget.dart';
import 'BMI_widget/gender_widget.dart';
import 'BMI_widget/height_widget.dart';
import 'BMI_widget/weight_widget.dart';

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Controller controller =Get.put(Controller());
    return Scaffold(
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
          child: Obx(()=>Container(
              color: Colors.white10,
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10,),
                  //Lets create widget for gender selection
                  GenderWidget(
                    onChange: (genderVal) {
                      controller.changeG(genderVal);
                    },
                  ),
                  SizedBox(height: 10,),
                  HeightWidget(
                    onChange: (heightVal) {
                      controller.changeH(heightVal);
                      controller.update();

                    },
                  ),
                  SizedBox(height: 10,),
                  WeightWidget(
                    onChange: (weightVal) {
                    controller.changeW(weightVal);
                    controller.update();

                    },
                  ),
                  AgeWeightWidget(
                      onChange: (ageVal) {
                        controller.changeA(ageVal);
                      },
                      title: "Age",
                      initValue: 30,
                      min: 0,
                      max: 100),
                  SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 60),
                    child: SwipeableButtonView(

                        isFinished: controller.isFinished.value,
                        onFinish: () async {
                          await Navigator.push(
                              context,
                              PageTransition(
                                  child: ScoreScreen(
                                    bmiScore: controller.bmiS.value,
                                    age: controller.a.value,
                                  ),
                                  type: PageTransitionType.fade));

                         controller.changeIsF(false);
                        },
                        onWaitingProcess: () {
                          //Calculate BMI here
                          controller.calculateBmi();

                          Future.delayed(Duration(seconds: 1), () {
                            controller.changeIsF(true);
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
}