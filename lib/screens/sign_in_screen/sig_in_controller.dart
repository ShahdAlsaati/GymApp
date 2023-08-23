import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym/home/home_screen.dart';
import 'package:gym/models/users/users_models.dart';
import 'package:gym/screens/on_boarding/on_boarding_sreen.dart';
import 'package:gym/screens/sign_in_screen/sig_in_services.dart';

import '../../db/db_helper.dart';


class SignInController extends GetxController{

  SignInServices services =SignInServices();
  late Rx<User?> _user;
  User get user => _user.value!;

  @override
  void onReady()
  {
    super.onReady();
    _user = Rx<User?>( FirebaseAuth.instance.currentUser);
    _user.bindStream( FirebaseAuth.instance.authStateChanges());
    ever<User?>(_user, _setInitializeScreen);

  }
  _setInitializeScreen(User? user)
  {
    if(user==null)
    {
      Get.offAll(()=>onBoardingSreen());

    }
    else{
      Get.offAll(()=>HomeScreen());
    }
  }
  var isPasswordShow= true.obs;

  IconData  suffix= Icons.visibility_outlined.obs.value;
  void changePPasswordVisibility(){
    isPasswordShow.value = !isPasswordShow.value;

    suffix=isPasswordShow.value? Icons.visibility_off_outlined:Icons.visibility_outlined;
  }
  RxList users=[].obs;

  getUsers() async{
    users.value=await services.getUser();

  }
  UserModel userModel=UserModel();

  addUser({
    required String name,
    required String email,
    required String password,
    required String gender,
    required String height,
    required String weight,
    required String age,
    required String address,
    required String phone,


  })async{
    print(userModel.name);
    await services.addUsers(
      name: name,
      email: email,
      password: password,
      gender: gender,
      height: height,
      weight: weight,
      age: age,
      address: address,
      phone: phone


    );
  }

  RxList healthInfo=[].obs;

  Future<int> addHealthInfoToDB({
    required String age,
    required String height,
    required String weight,
    required String gender,
    bool? smoke,
    bool? obesity,
    bool? heartDiseases,
    bool? familyHistory,
    bool? asthma,
  }) async
  {
    print("hello");
    print("I am workinggggggggggggggggggggggggggggggggggggggggggggggggg");

    return await DBHelper.insert( age: age,height: height,weight: weight, gender: gender, smoke: smoke,obesity: obesity,
        heartDiseases: heartDiseases,familyHistory: familyHistory,asthma: asthma);
  }
}