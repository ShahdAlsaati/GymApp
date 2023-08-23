import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym/health_form/health_form_screen.dart';
import 'package:gym/my_goal/my_goals_screen.dart';
import 'package:gym/style/colors.dart';

import '../models/my_current_cources/my_current_cources.dart';
import '../my_current_cources/my_cources_screen.dart';


class ProfileScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: smallYellowColor,
      appBar: AppBar(
        backgroundColor:smallYellowColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:30, vertical: 8),
        child: Column(

          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text(
                    "Shahd Alsaati",
                  style: TextStyle(
                    fontFamily: 'RobotoMono',
                    fontWeight: FontWeight.bold,
                    fontSize: 27
                  ),

                ),
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(

                    'assets/images/pro.png'
                  ),
                  backgroundColor: Colors.red.shade300,
                ),
              ],

            ),
            SizedBox(height: 35,),
            Container(

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Text(
                      "My information",
                      style: TextStyle(

                        fontFamily: 'Start',
                        fontSize: 30,
                      ),
                    ),
                  ),
                  IconButton(onPressed: (){
                    Get.to(MyInfoScreen());
                  }, icon: Icon(Icons.arrow_forward_ios_sharp))
                ],
              ),
              width: double.infinity,
              height: 50,
              color: yellowColor,
            ),
            SizedBox(height: 15,),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Text(
                      "My courses",
                      style: TextStyle(
                        fontFamily: 'Start',
                        fontSize: 30,
                      ),
                    ),
                  ),
                  IconButton(onPressed: (){
                    Get.to(MyCourcesScreen());
                  }, icon: Icon(Icons.arrow_forward_ios_sharp))
                ],
              ),
              width: double.infinity,
              height: 40,
              color: purpleColor,
            ),
            SizedBox(height: 15,),
            Container(
              
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Text(
                      "My goals",
                      style: TextStyle(
                        fontFamily: 'Start',
                        fontSize: 30,
                      ),
                    ),
                  ),
                  IconButton(onPressed: (){
                    Get.to(MyGoalScreen());
                  }, icon: Icon(Icons.arrow_forward_ios_sharp))
                ],
              ),
              width: double.infinity,
              height: 40,
              color: blueColor,
            ),
            SizedBox(height: 15,),
            Container(
            child:  Image(
                image: AssetImage(
                  'assets/images/pic.jpg',

                ),
              ),
            )
          ],
        ),
      ),

    );
  }
}
