import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class LoginServices {
  addUsers({

    required String email,
    required String password,


  }) async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);

    }catch(e)
    {
      print(e.toString());
      Get.snackbar('Error', 'error is $e');

    }
  }
}