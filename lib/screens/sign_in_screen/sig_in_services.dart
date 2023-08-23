import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:our_gym/home/home_screen.dart';
import 'package:our_gym/screens/sign_in_screen/sig_in_controller.dart';
import '../../shared/const/const.dart';
import '../../shared/network/local/cache_helper.dart';

class SignInServices{

  void signIn(String name,String email,String password ,String cPassword) async {
    try {
      final response = await http.post(
        Uri.parse('$ip/register'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'name': name,
          'email': email,
          'password': password,
          'c_password': cPassword,
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
        await CacheHelper.saveData(key: 'health_id',
            value: responseBody['data']['healthform_id'].toString()
        );

        await CacheHelper.saveData(key: 'name',
            value: responseBody['data']['name'].toString()
        );
        await CacheHelper.saveData(key: 'email',
            value: responseBody['data']['email'].toString()
        );
        print(responseBody['data']['user_id']);
        await Get.snackbar('success', responseBody['message'].toString());
       Get.to(HomeScreen());


      }
      else{
        print(response.statusCode );
        print('Response Reason Phrase: ${response.reasonPhrase}');
        await Get.snackbar('Error', 'Failed to update information');
      }
    }
    catch (e) {
      print(e.toString());
      Get.snackbar('Error', 'An error occurred during sign-in');
    }
    finally {
      Get.find<SignInController>().updateLoading(false); // Set loading to false in all cases
    }
  }
}