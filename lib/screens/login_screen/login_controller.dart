import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'login_services.dart';

class LoginController extends GetxController{

  LoginServices services =LoginServices();

  addUser({
    required String email,
    required String password,
})async{
    await services.addUsers(
        email: email,
        password: password,

    );
  }
}