import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym/health_form/health_form_screen.dart';
import 'package:gym/style/colors.dart';

import '../models/health_info/health_info_model.dart';
import 'edit_my_info_controller.dart';

class EditMyInfoScreen extends StatelessWidget {
  var formKey=GlobalKey<FormState>();

  TextEditingController _ageController=TextEditingController(text: '');
   TextEditingController _heightController=TextEditingController(text:'');
   TextEditingController _weightController=TextEditingController(text:'');
  @override
  Widget build(BuildContext context) {
    var _controller=Get.put<EditMyInfoController>(EditMyInfoController());

    //print(_controller.healthInfo.length);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.brown,
          weight: 600,
        ),
        title: Text(
          'Edit my Information Screen',
            style: TextStyle(
            color: Colors.brown,
        ),

      ),
        backgroundColor: Colors.orangeAccent,
      ),
      body: GetBuilder<EditMyInfoController>(
        init: EditMyInfoController(),

        builder: (controller)=> FutureBuilder(
          future:_controller.getHealthInfo(),

            builder: (context,snapshot) {

            if(_controller.healthInfo.isEmpty)
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    CircularProgressIndicator(
                      color: Colors.orangeAccent,
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text('Loading ....')
                  ],
                ),
              );
              if(snapshot.connectionState==ConnectionState.waiting||_controller.healthInfo.length==0)
              {
                return Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      CircularProgressIndicator(
                        color: Colors.orangeAccent,
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text('Loading ....')
                    ],
                  ),
                );
              }
              else {
                _ageController=TextEditingController(text: _controller.healthInfo[0].age??'');
                _heightController=TextEditingController(text:_controller.healthInfo[0].height??'');
                _weightController=TextEditingController(text: _controller.healthInfo[0].weight??'');
                return SingleChildScrollView(

                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(

                      decoration: BoxDecoration(
                        color: pageColor,
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.8),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 5), // changes position of shadow
                          ),
                        ],

                      ),
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 18.0),
                              child: Text('Age :'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 18.0, bottom: 18, right: 18),
                              child: TextFormField(
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.number,
                                controller: _ageController,

                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                    hintText: _controller.healthInfo[0].age ??
                                        '',
                                    hintStyle: TextStyle(color: yellowColor),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: yellowColor)
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: yellowColor)
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red),
                                    )
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left: 18.0),
                              child: Text('Height :'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 18.0, bottom: 18, right: 18),
                              child: TextFormField(
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.number,
                                controller: _heightController,

                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                    hintText: _controller.healthInfo[0]
                                        .height ?? '',
                                    hintStyle: TextStyle(color: yellowColor),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: yellowColor)
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: yellowColor)
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red),
                                    )
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 18.0),
                              child: Text('Weight :'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 18.0, bottom: 18, right: 18),
                              child: TextFormField(
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.number,
                                controller: _weightController,


                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                    hintText: _controller.healthInfo[0]
                                        .weight ?? '',
                                    hintStyle: TextStyle(color: yellowColor),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: yellowColor)
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: yellowColor)
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red),
                                    )
                                ),
                              ),
                            ),
                            Obx(() =>
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0,
                                        bottom: 10,
                                        left: 15,
                                        right: 15),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Text('Are you smoker',
                                          style: TextStyle(
                                              fontSize: 20
                                          ),),
                                        Checkbox(
                                            value: _controller.isChecked.value,
                                            onChanged: (v) {
                                              _controller.toggle();
                                            }),
                                        // Text(' '),
                                      ],
                                    ),
                                  ),
                                ),),
                            Obx(() =>
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0,
                                        bottom: 10,
                                        left: 15,
                                        right: 15),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Text('family history with overweight',
                                          style: TextStyle(
                                              fontSize: 20
                                          ),),
                                        Checkbox(
                                            value: _controller.isChecked1.value,
                                            onChanged: (v) {
                                              _controller.toggle1();
                                            }),
                                        // Text(' '),
                                      ],
                                    ),
                                  ),
                                ),),
                            Obx(() =>
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0,
                                        bottom: 10,
                                        left: 15,
                                        right: 15),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Text('obesity',
                                          style: TextStyle(
                                              fontSize: 20
                                          ),),
                                        Checkbox(
                                            value: _controller.isChecked2.value,
                                            onChanged: (v) {
                                              _controller.toggle2();
                                            }),
                                        // Text(' '),
                                      ],
                                    ),
                                  ),
                                ),),
                            Obx(() =>
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0,
                                        bottom: 10,
                                        left: 15,
                                        right: 15),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Text('asthma',
                                          style: TextStyle(
                                              fontSize: 20
                                          ),),
                                        Checkbox(
                                            value: _controller.isChecked3.value,
                                            onChanged: (v) {
                                              _controller.toggle3();
                                            }),
                                        // Text(' '),
                                      ],
                                    ),
                                  ),
                                ),),
                            Obx(() =>
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0,
                                        bottom: 10,
                                        left: 15,
                                        right: 15),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Text('Cardiovascular diseases',
                                          style: TextStyle(
                                              fontSize: 20
                                          ),),
                                        Checkbox(
                                            value: _controller.isChecked4.value,
                                            onChanged: (v) {
                                              _controller.toggle4();
                                            }),
                                        // Text(' '),
                                      ],
                                    ),
                                  ),
                                ),),

                            SizedBox(
                              width: 10,
                            ),

                            SizedBox(

                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Container(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.7,
                                height: 40,
                                child: OutlinedButton(

                                  onPressed: () {
                                    _controller.updateHealthForm(
                                        age: _ageController.text,
                                        height: _heightController.text,
                                        weight: _weightController.text)
                                        .
                                    then((value) {
                                      _controller.updateHealthInfoToDB(
                                          age: _ageController.text,
                                          height: _heightController.text,
                                          weight: _weightController.text
                                      );
                                    })
                                        .then((value) {
                                      Get.back();
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      SizedBox(width: 80,),
                                      Text('Apply', style: TextStyle(
                                          color: Colors.black
                                      ),),
                                      SizedBox(width: 10,),
                                      Icon(
                                        Icons.done,
                                        size: 16,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),

                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }
            },
        ),
      ),
    );
  }
}
