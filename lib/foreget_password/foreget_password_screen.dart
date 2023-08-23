import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym/foreget_password/foreget_password_controller.dart';
import 'package:gym/style/colors.dart';

class ForgetPasswordScreen extends StatelessWidget {
  final TextEditingController _forgetPasswordController=TextEditingController(text: '');
  var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    ForgetPasswordController crt=Get.put(ForgetPasswordController());


    return Scaffold(
      backgroundColor: pageColor,
      body:  Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            SizedBox(
              height: size.height*0.1,

            ),
            const Text(
              'Forget Password',
              style: TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.bold,
                fontFamily: 'Start',
                fontSize: 40,

              ),

            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Email Address',
              style: TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontSize: 18,

              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _forgetPasswordController,
              decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white54,
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.brown),

                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.brown),

                  )
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            MaterialButton(
              onPressed:(){
                crt.changePassword(email: _forgetPasswordController.text);
              },
              color: Colors.orange,
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13),
              ),
              child: Text(
                'Reset now',
                style: TextStyle(
                  color: Colors.brown,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: 20,
                ),
              ),

            ),
            SizedBox(
              height: 25,
            ),
            Image(image: AssetImage(
              'assets/images/think.jfif',

            ),
              fit: BoxFit.fill,

            ),

          ],
        ),
      ),

    );
  }
}
