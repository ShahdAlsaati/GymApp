import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'login_services.dart';

class LoginController extends GetxController{
  var isPasswordShow = true.obs;

  IconData suffix = Icons.visibility_off_outlined.obs.value;

  void changePPasswordVisibility() {
    isPasswordShow.value = !isPasswordShow.value;

    suffix = isPasswordShow.value ? Icons.visibility_off_outlined : Icons
        .visibility_outlined;
  }
  LoginServices services =LoginServices();
   login({
    required String email,
    required String password,
}){
    services.login(email, password);
  }
  final RxBool isLoading = false.obs;

  updateLoading(bool value) {
    isLoading.value = value;
  }
  confirmSignOut()async{
   await services.confirmSignOut();
    isLoading.value = false;
  }
}