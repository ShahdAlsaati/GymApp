import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'foreget_password_services.dart';


class ForgetPasswordController extends GetxController{

  ForgetPasswordServices services =ForgetPasswordServices();

  changePassword({
    required String email,
  })async{
    await services.forgetPasswordSubmitForm(
      email: email,

    );
  }
}