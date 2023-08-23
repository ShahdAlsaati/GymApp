import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:our_gym/screens/sign_in_screen/sig_in_services.dart';
import 'package:our_gym/shared/network/local/cache_helper.dart';



class SignInController extends GetxController {

  SignInServices services = SignInServices();

  @override
  void onReady() {
    super.onReady();
  }

  var isPasswordShow = true.obs;

  IconData suffix = Icons.visibility_off_outlined.obs.value;

  void changePPasswordVisibility() {
    isPasswordShow.value = !isPasswordShow.value;

    suffix = isPasswordShow.value ? Icons.visibility_off_outlined : Icons
        .visibility_outlined;
  }

  var isPasswordShow2 = true.obs;

  IconData suffix2 = Icons.visibility_off_outlined.obs.value;

  void changePPasswordVisibility2() {
    isPasswordShow2.value = !isPasswordShow2.value;

    suffix2 = isPasswordShow2.value ? Icons.visibility_off_outlined : Icons
        .visibility_outlined;
  }


  RxList users = [].obs;


  RxList healthInfo = [].obs;

  signin(
      {required String name, required String email, required String password, required String cPassword}) {
    services.signIn(name, email, password, cPassword);
  }
  final RxBool isLoading = false.obs;


  updateLoading(bool value) {
    isLoading.value = value;
  }

}