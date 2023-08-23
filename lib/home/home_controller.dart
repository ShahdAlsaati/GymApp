import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym/screens/login_screen/login_screen.dart';
import 'package:gym/style/colors.dart';

import 'home_services.dart';

class TapController extends GetxController{
  HomeServices services =HomeServices();

  var imName='gym.jpg'.obs;
   changeImages(){
     imName.value="gym1.jpg";
    // update();
   }
  logout() async{

    debugPrint('Sign Out');
     await FirebaseAuth.instance.signOut();
     Get.to(LoginScreen());

  }
  confirmSignOut(){
    Get.defaultDialog(
      title: 'confirm logout',
      middleText: 'Are you sur??',
      textCancel: 'cancel',
      textConfirm: 'confirm',
      buttonColor: Colors.orange,
      confirmTextColor: Colors.black,
      cancelTextColor: Colors.black,
      onConfirm: (){
        logout();
      },
      radius: 30,
      barrierDismissible: false,

    );
  }
  RxList uesrName=[].obs;

  getUser() async{
    uesrName.value= await services.getName();
  }

}