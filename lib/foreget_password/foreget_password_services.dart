import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:gym/screens/login_screen/login_screen.dart';

class ForgetPasswordServices {
  final FirebaseAuth _auth=FirebaseAuth.instance;

   forgetPasswordSubmitForm({required String email}) async {
    try{
      await _auth.sendPasswordResetEmail(
          email:email
      );
      Get.to(LoginScreen());
    }
    catch(error){

      Fluttertoast.showToast(msg: error.toString());

    }
  }

}