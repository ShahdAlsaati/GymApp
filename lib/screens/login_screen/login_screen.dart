import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gym/foreget_password/foreget_password_screen.dart';
import 'package:gym/home/home_screen.dart';
import 'package:gym/screens/login_screen/login_controller.dart';
import 'package:gym/style/colors.dart';


import '../sign_in_screen/sign_in_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
final TextEditingController _emailController=TextEditingController(text: '');
final TextEditingController _passwordController=TextEditingController(text: '');

var formKey=GlobalKey<FormState>();


bool _obscureText = true;

class _LoginScreenState extends State<LoginScreen> {
  @override
  void dispose(){

    super.dispose();
  }
  @override
  void initState(){

    super.initState();
  }
  @override

  Widget build(BuildContext context) {
    LoginController crt=Get.put(LoginController());


    return  Scaffold(
      body:Container(
        width: double.infinity,
        decoration: BoxDecoration(
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
              child: Text("Login",
                style: TextStyle(
                  fontFamily: 'Start',
                    fontSize: 50,
                    fontWeight: FontWeight.bold
                ),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0,top: 10),
              child: Text('Welcome back',
              style: TextStyle(
                fontFamily: 'Bookstory',
                fontSize: 35,
                fontWeight: FontWeight.w400
              ),),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(20.0),

            ),
            SizedBox(height: 10,),
            Expanded(child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(60),topRight:Radius.circular(60) ),

                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child:  Center(
                      child: Container(
                        // color: Colors.white,
                        height: 570,
                        width: 350,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40),bottomLeft:Radius.circular(40),bottomRight: Radius.circular(40), ),
                        ),
                        child: Form(
                          key: formKey,
                          
                          child: SingleChildScrollView(
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    SizedBox(
                                      height:20,
                                    ),

                                    // SizedBox(
                                    //   height:30,
                                    // ),

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
                                      style: TextStyle(color:yellowColor),
                                      decoration: InputDecoration(
                                          icon: Icon(
                                              Icons.email,
                                            color: yellowColor,
                                          ),
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
                                    TextFormField(
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.visiblePassword,
                                      controller: _passwordController,
                                      obscureText: !_obscureText,
                                      validator: (value){
                                        if(value!.isEmpty|| value.length<6){
                                          return 'Please enter valid password ';
                                        }
                                        else
                                        {
                                          return null;
                                        }

                                      },
                                      style: TextStyle(color: Colors.black),
                                      decoration: InputDecoration(
                                          suffixIcon: GestureDetector(
                                            onTap: (){
                                              setState(() {
                                                _obscureText=!_obscureText;
                                              });
                                            },
                                            child: Icon(
                                                _obscureText?
                                                Icons.visibility:
                                                Icons.visibility_off
                                            ),

                                          ),
                                          hintText:'password',
                                          icon: Icon(
                                            Icons.lock,
                                            color: yellowColor,

                                          ),
                                          hintStyle: TextStyle(color:yellowColor),
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(color: yellowColor)
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(color:yellowColor)
                                          ),
                                          errorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.red),
                                          )
                                      ),
                                    ),



                                    SizedBox(
                                      height:15,),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 160,
                                        ),
                                        TextButton(
                                          onPressed: (){
                                            Get.to(ForgetPasswordScreen());
                                          },
                                          child: Text(
                                            'forget password?',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 17,
                                                fontStyle: FontStyle.italic
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height:5,),
                                    Container(

                                      width: 400,
                                      child: MaterialButton(
                                        onPressed:(){
                                          if(formKey.currentState!.validate()){
                                           try{ crt.addUser(
                                              email: _emailController.text,
                                              password: _passwordController.text,

                                            ).then((value){
                                              Get.to(HomeScreen());
                                            });}
                                           catch(e)
                                           {
                                             print(e.toString());

                                           }
                                          }


                                        },
                                        color: yellowColor,
                                        child: Text(
                                          'Login'
                                          ,style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold
                                        ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height:5,),
                                    Row(
                                      mainAxisAlignment:MainAxisAlignment.center ,
                                      children: [
                                        Text(
                                          'don\'t have an account ?',
                                          style: TextStyle(
                                              color: Colors.black
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: (){
                                            Get.to(signInScreen());
                                          },
                                          child: Text(
                                            'sign in'
                                            ,
                                            style: TextStyle(
                                              color: yellowColor,
                                            ),
                                          ),

                                        ),
                                      ],
                                    ),
                                    Image(
                                      image: AssetImage(
                                        'assets/images/login.jpg',

                                      ),
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
              ),
            ))
          ],
        ),
      ),



    );
  }
}
