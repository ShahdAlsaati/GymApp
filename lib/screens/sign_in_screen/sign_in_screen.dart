import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:our_gym/screens/login_screen/login_screen.dart';
import 'package:our_gym/screens/sign_in_screen/sig_in_controller.dart';
import 'package:our_gym/style/colors.dart';

import '../../shared/network/local/cache_helper.dart';


class signInScreen extends StatelessWidget {
  final TextEditingController _emailController=TextEditingController(text: '');

  final TextEditingController _passwordController=TextEditingController(text: '');

  final TextEditingController _nameController=TextEditingController(text: '');

  final TextEditingController _confirmController=TextEditingController(text: '');

  var formKey=GlobalKey<FormState>();
  SignInController crt=Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;

    if(CacheHelper.getData(key: 'token')==null)
      crt.isLoading.value = false;

    return Scaffold(
      body:Container(
        width: double.infinity,
        decoration: BoxDecoration(
         // color: purpleColor
          gradient: LinearGradient(
              colors: [
                yellowColor,
                Colors.orange.shade100,
              ]
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 40,

            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text("Register",
                style: TextStyle(
                    fontFamily: 'Start',

                    fontSize: 50,
                    fontWeight: FontWeight.bold
                ),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0,top: 10),
              child: Text('I thought I was strong until I tried to do crossfit ',
                style: TextStyle(
                    fontFamily: 'Bookstory',
                    fontSize: 25,
                    fontWeight: FontWeight.w400
                ),),
            ),
            SizedBox(height: 10,),
          //  SizedBox(height: 60,),

            SizedBox(height: 20,),
            Expanded(child: SingleChildScrollView(
              child: Container(

                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(60),topRight:Radius.circular(60) ),

                ),

                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child:  Center(
                    child: Container(
                      // color: Colors.white,
                      height: size.height*0.75,
                      width: 350,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40),bottomLeft:Radius.circular(40),bottomRight: Radius.circular(40), ),
                      ),
                      child: SingleChildScrollView(
                        child: Form(
                          key: formKey,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  SizedBox(
                                    height:10,
                                  ),

                                  // SizedBox(
                                  //   height:30,
                                  // ),
                                  TextFormField(
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.name,
                                    controller: _nameController,
                                    validator: (value){
                                      if(value!.isEmpty){
                                        return 'Please enter valid name';
                                      }
                                      else
                                      {
                                        return null;
                                      }

                                    },
                                    style: TextStyle(color: yellowColor),
                                    decoration: InputDecoration(
                                        hintText:'Name',
                                        hintStyle: TextStyle(color: yellowColor),
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: yellowColor)
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: yellowColor)
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.red),
                                        )
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  TextFormField(
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.emailAddress,
                                    controller: _emailController,
                                    validator: (value){
                                      if(value!.isEmpty|| !value.contains('@')){
                                        return 'Please enter valid email address';
                                      }
                                      else
                                      {
                                        return null;
                                      }

                                    },
                                    style: TextStyle(color: yellowColor),
                                    decoration: InputDecoration(
                                        hintText:'Email',
                                        hintStyle: TextStyle(color: yellowColor),
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: yellowColor)
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: yellowColor)
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.red),
                                        )
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Obx(()=> TextFormField(
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.visiblePassword,
                                      controller: _passwordController,
                                      obscureText: crt.isPasswordShow.value,
                                      validator: (value){
                                        if(value!.isEmpty){
                                          return 'Please enter valid password ';
                                        }
                                        if( value.length<6){
                                          return 'Your password too short';
                                        }
                                        else
                                        {
                                          return null;
                                        }

                                      },
                                      style: TextStyle(color: Colors.black),
                                      decoration: InputDecoration(

                                          suffixIcon: IconButton(
                                            onPressed: (){
                                              crt.changePPasswordVisibility();
                                            },
                                            icon: Icon(
                                                crt.suffix,
                                            ),

                                          ),
                                          hintText:'password',
                                          hintStyle: TextStyle(color: yellowColor),
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(color: yellowColor)
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(color: yellowColor)
                                          ),
                                          errorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color:yellowColor),
                                          )
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Obx(()=> TextFormField(
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.visiblePassword,
                                    controller: _confirmController,
                                    obscureText: crt.isPasswordShow2.value,
                                    validator: (value){
                                      if(_confirmController.text!=_passwordController.text){
                                        return 'Please match the password ';
                                      }

                                      else
                                      {
                                        return null;
                                      }

                                    },
                                    style: TextStyle(color: Colors.black),
                                    decoration: InputDecoration(

                                        suffixIcon: IconButton(
                                          onPressed: (){
                                            crt.changePPasswordVisibility2();
                                          },
                                          icon: Icon(
                                            crt.suffix2,
                                          ),

                                        ),
                                        hintText:'confirm password',
                                        hintStyle: TextStyle(color: yellowColor),
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: yellowColor)
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: yellowColor)
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color:yellowColor),
                                        )
                                    ),
                                  ),
                                  ),

                                  SizedBox(height: 15,),
                                  Obx(()=> crt.isLoading.value
                                      ? Center(child: CircularProgressIndicator(
                                    color: yellowColor,
                                  )):Container(
                                    decoration: BoxDecoration(
                                      color: yellowColor,

                                      borderRadius: BorderRadius.circular(15),

                                    ),
                                    width: 350,
                                    child:  MaterialButton(
                                      onPressed:() async {
                                        if (formKey.currentState!.validate()) {
                                          crt.updateLoading(true);
                                          await   crt.signin(
                                              email: _emailController.text
                                                  .toString(),
                                              password: _passwordController
                                                  .text.toString(),
                                              name: _nameController.text.toString(),
                                            cPassword: _confirmController.text.toString(), );
                                        }
                                        crt.update();


                                      },
                                      child: const Text(
                                        'Register',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),                                        ),
                                  ),
                                  ),
                                  SizedBox(
                                    height:5,),
                                  Row(
                                    mainAxisAlignment:MainAxisAlignment.center ,
                                    children: [
                                      Text(
                                        'already have an account ?',
                                        style: TextStyle(
                                            color: Colors.black
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: (){
                                          Get.to(LoginScreen());

                                        },
                                        child: Text(
                                          'Login'
                                          ,
                                          style: TextStyle(
                                            color: Colors.orange,
                                          ),
                                        ),

                                      ),
                                    ],
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ))
          ],
        ),
      ),


    );
  }
}
