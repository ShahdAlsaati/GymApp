import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym/screens/sign_in_screen/sig_in_services.dart';

import 'courses_services.dart';



class CoursesController extends GetxController{

  CoursesServices services =CoursesServices();
  RxList workout=[].obs;

  RxList yoga=[].obs;

  RxList fullBodyWeight=[].obs;

  RxList cardio=[].obs;

  RxList zumba=[].obs;

  getZumba() async{
    zumba.value=await services.getZumba();

  }

  getCardio() async{
    cardio.value=await services.getCardio();

  }

  getWorkout() async{
    workout.value=await services.getWorkOut();

  }
  getYoga() async{
    yoga.value=await services.getYoga();

  }
  getFullBodyWeight() async{
    fullBodyWeight.value=await services.getFullBodyWeight();

  }


  confirmJoin(String cid){
    Get.defaultDialog(
      title: 'enroll this course',
      middleText: 'Are you sur??',
      textCancel: 'cancel',
      textConfirm: 'confirm',
      buttonColor:Colors.orange,
      confirmTextColor: Colors.black,
      cancelTextColor: Colors.black,
      onConfirm: (){
        services.addCourses(cid);
      },
      radius: 30,
      barrierDismissible: false,

    );
  }

}