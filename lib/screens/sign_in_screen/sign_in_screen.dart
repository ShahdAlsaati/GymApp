import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gym/home/home_screen.dart';
import 'package:gym/screens/login_screen/login_screen.dart';
import 'package:gym/screens/sign_in_screen/sig_in_controller.dart';
import 'package:gym/style/colors.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';


class signInScreen extends StatefulWidget {
  @override
  State<signInScreen> createState() => _signInScreenState();
}

class _signInScreenState extends State<signInScreen> {
  final TextEditingController _emailController=TextEditingController(text: '');
  final TextEditingController _passwordController=TextEditingController(text: '');
  final TextEditingController _nameController=TextEditingController(text: '');
  final TextEditingController _phoneController=TextEditingController(text: '');
  final TextEditingController _addressController=TextEditingController(text: '');
  final TextEditingController _genderController=TextEditingController(text: '');
  final TextEditingController _ageController=TextEditingController(text: '');
  final TextEditingController _heightController=TextEditingController(text: '');
  final TextEditingController _weightController=TextEditingController(text: '');


  var formKey=GlobalKey<FormState>();
  String _selectedGender="Gender";



  List<String> gengerList=[
    "Male",
    "Female",

  ];
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
    Size size=MediaQuery.of(context).size;
    SignInController crt=Get.put(SignInController());


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
              child: Text('Welcome ',
                style: TextStyle(
                    fontFamily: 'Bookstory',
                    fontSize: 50,
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
                                  TextFormField(
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.phone,
                                    controller: _phoneController,
                                    validator: (value){
                                      if(value!.isEmpty){
                                        return 'Please enter valid phone number';
                                      }
                                      else
                                      {
                                        return null;
                                      }

                                    },
                                    style: TextStyle(color: Colors.redAccent),
                                    decoration: InputDecoration(
                                        hintText:'Phone number',
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
                                    keyboardType: TextInputType.text,
                                    controller: _addressController
                                    ,
                                    validator: (value){
                                      if(value!.isEmpty){
                                        return 'Please enter valid address';
                                      }
                                      else
                                      {
                                        return null;
                                      }

                                    },
                                    style: TextStyle(color: yellowColor),
                                    decoration: InputDecoration(
                                        hintText:'Address',
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
                                    keyboardType: TextInputType.number,
                                    controller: _ageController
                                    ,
                                    validator: (value){
                                      if(value!.isEmpty){
                                        return 'Please enter valid age';
                                      }
                                      else
                                      {
                                        return null;
                                      }

                                    },
                                    style: TextStyle(color: yellowColor),
                                    decoration: InputDecoration(
                                        hintText:'Age',
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
                                    keyboardType: TextInputType.text,
                                    controller: _genderController,
                                    style: TextStyle(color: Colors.redAccent),
                                    decoration: InputDecoration(
                                      hintText:'$_selectedGender',
                                        suffixIcon:DropdownButton(
                                          icon: Icon(Icons.keyboard_arrow_down,
                                            color: Colors.grey,
                                          ),
                                          iconSize: 32,
                                          elevation: 4,
                                          underline: Container(height: 0,),
                                          items: gengerList.map<DropdownMenuItem<String>>((String? value)
                                          {
                                            return DropdownMenuItem<String>(
                                              value: value.toString(),
                                              child: Text(
                                                value.toString(),
                                                style: TextStyle(
                                                    color: Colors.grey
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              _selectedGender=newValue!;
                                            });
                                          },
                                        ),

                                     //   hintText:'Gender',
                                        hintStyle: TextStyle(color: yellowColor),
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
                                  TextFormField(
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.number,
                                    controller: _heightController,

                                    validator: (value){
                                      if(value!.isEmpty){
                                        return 'cannot be empty';
                                      }
                                      else
                                      {
                                        return null;
                                      }

                                    },
                                    style: TextStyle(color: yellowColor),
                                    decoration: InputDecoration(
                                        hintText:'Height',
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
                                    keyboardType: TextInputType.number,
                                    controller: _weightController,

                                    validator: (value){
                                      if(value!.isEmpty){
                                        return 'cannot be empty';
                                      }
                                      else
                                      {
                                        return null;
                                      }

                                    },
                                    style: TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                        hintText:'Weight',
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
                                  SizedBox(height: 10,),
                                  Container(

                                    width: 400,
                                    child: MaterialButton(

                                      onPressed:(){
                                        if(formKey.currentState!.validate()){
                                      crt.addUser(name: _nameController.text,
                                          phone: _phoneController.text,
                                          email: _emailController.text,
                                          password: _passwordController.text,
                                          gender: _selectedGender,
                                          age: _ageController.text,
                                          height:_heightController.text,
                                          weight: _weightController.text,
                                        address: _addressController.text
                                      ).then((value){
                                        print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhelo");

                                        crt.addHealthInfoToDB(age: _ageController.text,
                                            height: _heightController.text, weight: _weightController.text,
                                            gender: _selectedGender);
                                      }).then((value){
                                        Get.to(HomeScreen());

                                      });
                                     }
                                    },
                                      color: Colors.orange,
                                      child: Text(
                                        'Register'
                                        ,style: TextStyle(
                                          color: Colors.brown,
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
