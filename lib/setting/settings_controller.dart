import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym/home/home_screen.dart';
import 'package:gym/models/users/users_models.dart';
import 'package:gym/screens/on_boarding/on_boarding_sreen.dart';
import 'package:gym/screens/sign_in_screen/sig_in_services.dart';
import 'package:gym/setting/settings_services.dart';

import '../../db/db_helper.dart';


class SettingsController extends GetxController{

  SettingsServices services =SettingsServices();
  late Rx<User?> _user;
  User get user => _user.value!;

  @override
  void onReady()
  {
    super.onReady();
    getUser();

  }
  RxList uesrData=[].obs;

  getUser() async{
    uesrData.value= await services.getUser();
  }

  UserModel userModel=UserModel();

  updateUser({
    required String name,
    required String email,
    required String phone,
    required String address,


  })async{
    print(userModel.name);
    await services.updateUsers(
        name: name,
        email: email,
        phone: phone,
        address: address,


    );
  }


}