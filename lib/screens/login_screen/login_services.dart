import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:our_gym/home/home_screen.dart';
import '../../shared/const/const.dart';
import '../../shared/network/local/cache_helper.dart';
import 'login_controller.dart';
import 'login_screen.dart';

class LoginServices {
  void login(String email,String password ) async {
    try {
      if(email==null||password==null)
        await Get.snackbar('error', 'Nulllllllllll');
      final response = await http.post(
        Uri.parse('$ip/login'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{

          'email': email,
          'password': password,

        }),
      );

      if (response.statusCode == 200) {

        final responseBody = json.decode(response.body);


        print(responseBody['data']['token'].toString());


        await CacheHelper.saveData(key: 'token',
            value: responseBody['data']['token'].toString()
        );
        await CacheHelper.saveData(key: 'id',
            value: responseBody['data']['user_id'].toString()
        );
        print(responseBody['data']['user_id']);
        await CacheHelper.saveData(key: 'health_id',
            value: responseBody['data']['healthform_id'].toString()
        );
        await CacheHelper.saveData(key: 'name',
            value: responseBody['data']['name'].toString()
        );
        await CacheHelper.saveData(key: 'email',
            value: responseBody['data']['email'].toString()
        );
        await Get.snackbar('success', 'Login Successfully');
        await Get.to(HomeScreen());


      }
      else  if (response.statusCode == 404) {

        final responseBody = json.decode(response.body);
        await Get.snackbar('Error', 'You don\'t have an account');
        print('Response Reason Phrase: ${response.reasonPhrase}');

      }

      else{
        print(response.statusCode );
        print('Response Reason Phrase: ${response.reasonPhrase}');
        await Get.snackbar('Error', 'Failed to update information');
      }
    }
    catch (e) {
      print(e.toString());
      Get.snackbar('Error', 'An error occurred during login');
    }
    finally {
      Get.find<LoginController>().updateLoading(false); // Set loading to false in all cases
    }
  }
  logout() async {
    await CacheHelper.removeData(key: 'token');
    await CacheHelper.removeData(key: 'id');
    await CacheHelper.removeData(key: 'health_id');
    await CacheHelper.removeData(key: 'name');
    await CacheHelper.removeData(key: 'email');

    await Get.to(LoginScreen());
  }
  confirmSignOut(){
    Get.defaultDialog(
      title: 'confirm logout',
      middleText: 'To get fit don\'t quit',
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

}