import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym/style/colors.dart';

import '../edit_my_info/edit_my_info_screen.dart';
import 'health_form_controller.dart';

class MyInfoScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var _controller=Get.put<HealthInfoController>(HealthInfoController());

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.brown,
          weight: 600
        ),
        title: Text(
          'My Information Screen',
            style: TextStyle(

            color: Colors.brown,
        ),

      ),
        backgroundColor: Colors.orangeAccent,
      ),
      body: GetBuilder<HealthInfoController>(
        init: HealthInfoController(),
        builder: (controller)=>FutureBuilder(
        future:_controller.getHealthInfoFromFireBase(),
         builder: (context,snapshot) {
           if(snapshot.connectionState==ConnectionState.waiting)
           {
             return  Center(
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
           else
           return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(

                decoration: BoxDecoration(
                  color: pageColor,
                  borderRadius: BorderRadius.circular(40),
              boxShadow:  [
                BoxShadow(
                color: Colors.grey.withOpacity(0.8),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 5), // changes position of shadow
              ),
              ],

                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0,bottom: 10, left: 15, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Age', style: TextStyle(
                                fontSize: 20
                            ),),

                            Text('${_controller.healthInfo[0].age}', style: TextStyle(
                                fontSize: 20
                            ),),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0,bottom: 10, left: 15, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Height', style: TextStyle(
                                fontSize: 20
                            ),),
                            Text('${_controller.healthInfo[0].height}', style: TextStyle(
                                fontSize: 20
                            ),),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0,bottom: 10, left: 15, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Weight',
                              style: TextStyle(
                                  fontSize: 20
                              ),),
                            Text('${_controller.healthInfo[0].weight}',
                            style: TextStyle(
                                fontSize: 20
                            ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Obx(()=> Container(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0,bottom: 10, left: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Are you smoker',
                                style: TextStyle(
                                    fontSize: 20
                                ),),
                              Checkbox(value:_controller.healthInfo[0].smoke!=null?_controller.healthInfo[0].smoke:false,
                                  onChanged: (v){
                                // _controller.toggle();
                              }),
                             // Text(' '),
                            ],
                          ),
                        ),
                      ),),
                    Obx(()=> Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0,bottom: 10, left: 15, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('family history with overweight',
                              style: TextStyle(
                                  fontSize: 20
                              ),),
                            Checkbox(value:_controller.healthInfo[0].familyHistory!=null?_controller.healthInfo[0].familyHistory:false  ,
                                onChanged: (v){
                                  // _controller.toggle1();
                                }),
                            // Text(' '),
                          ],
                        ),
                      ),
                    ),),
                    Obx(()=> Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0,bottom: 10, left: 15, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('obesity',
                              style: TextStyle(
                                  fontSize: 20
                              ),),
                            Checkbox(value:_controller.healthInfo[0].obesity!=null?_controller.healthInfo[0].obesity:false  ,
                                onChanged: (v){
                                  // _controller.toggle2();
                                }),
                            // Text(' '),
                          ],
                        ),
                      ),
                    ),),
                    Obx(()=> Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0,bottom: 10, left: 15, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('asthma',
                              style: TextStyle(
                                  fontSize: 20
                              ),),
                            Checkbox(value:_controller.healthInfo[0].asthma!=null?_controller.healthInfo[0].asthma:false ,
                                onChanged: (v){
                                  // _controller.toggle3();
                                }),
                            // Text(' '),
                          ],
                        ),
                      ),
                    ),),
                    Obx(()=> Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0,bottom: 10, left: 15, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Cardiovascular diseases ',
                              style: TextStyle(
                                  fontSize: 20
                              ),),
                            Checkbox(value:_controller.healthInfo[0].heartDiseases!=null?_controller.healthInfo[0].heartDiseases:false,
                                onChanged: (v){
                                  // _controller.toggle4();
                                }),
                            // Text(' '),
                          ],
                        ),
                      ),
                    ),),

                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width*0.7,
                      height: 40,
                      child: OutlinedButton(

                        onPressed: ()async {
                         await Get.to(EditMyInfoScreen());
                        },
                        child: Row(
                          children: [
                            SizedBox(width: 80,),
                            Text('Edit', style: TextStyle(
                              color: Colors.brown
                            ),),
                            SizedBox(width: 10,),
                            Icon(
                              Icons.edit,
                              size: 16,
                              color: Colors.brown,
                            ),
                          ],
                        ),

                      ),
                    ),
                    SizedBox(height: 20,)
                  ],
                ),
              ),
            ),
          );
         },
        ),
      ),
    );
  }
}
// return Center(
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.center,
// mainAxisAlignment: MainAxisAlignment.center,
//
// children: [
// SizedBox(
// height: 100,
// ),
// CircularProgressIndicator(
// color: Colors.orangeAccent,
// ),
// SizedBox(
// height: 7,
// ),
// Text('Loading ....')
// ],
// ),
// );