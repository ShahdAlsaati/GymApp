import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gym/All_courses/cardio_screen.dart';
import 'package:gym/All_courses/full_body_work_screen.dart';
import 'package:gym/All_courses/workout_screen.dart';
import 'package:gym/All_courses/yoga_screen.dart';
import 'package:gym/style/colors.dart';

import '../All_courses/zumba_screen.dart';
import '../home/home_controller.dart';

class ActivityScreen extends StatelessWidget {
  TapController crt=Get.put(TapController());

  @override
  Widget build(BuildContext context) {
    var size =MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor:pageColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60,),
              InkWell(
                onTap: (){
                  Get.to(ZumbaScreen());
                },
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow:  [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.8),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 5), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(100),
                    color: purpleColor,
                  ),
                  width: 200,
                  height: 200,
                  child: Center(
                    child: Text(
                      "ZUMBA",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26
                      ),

                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 160,
                  ),
                  InkWell(
                    onTap: (){
                      Get.to(WorkOutScreen());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow:  [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.8),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 5), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(100),
                        color: yellowColor,
                      ),
                      width: 200,
                      height: 200,
                      child: Center(
                        child: Text(
                            "WORKOUT",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 26
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              InkWell(
                onTap: (){
                  Get.to(FullBodyWeight());

                },
                child: Container(

                  decoration: BoxDecoration(
                    boxShadow:  [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.8),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 5), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(100),
                    color: blueColor,
                  ),
                  width: 200,
                  height: 200,
                  child: Center(
                    child: Text(
                      "Full body weight",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26
                      ),

                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 160,
                  ),

                  InkWell(
                    onTap: (){
                      Get.to(CardioScreen());

                    },
                    child: Container(

                      decoration: BoxDecoration(
                        boxShadow:  [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.8),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 5), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.orangeAccent,
                      ),
                      width: 200,
                      height: 200,
                      child: Center(
                        child: Text(
                          "Cardio",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 26
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),

              InkWell(
                onTap: (){
                  Get.to(YogaScreen());

                },
                child: Container(

                  decoration: BoxDecoration(
                    boxShadow:  [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.8),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 5), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.greenAccent,
                  ),
                  width: 200,
                  height: 200,
                  child: Center(
                    child: Text(
                      "Yoga",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
