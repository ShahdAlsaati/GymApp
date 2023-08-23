import 'package:flutter/material.dart';

import '../style/colors.dart';

class MyGoalScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.brown,
          weight: 500
        ),
        title: Text(

          'My goals',
          style: TextStyle(
            color: Colors.brown,

          ),
        ),
        backgroundColor: Colors.orangeAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: pageColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black45),
                  boxShadow:  [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.8),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 5), // changes position of shadow
                    ),
                  ],

                ),
                child: Padding(
                  padding: const EdgeInsets.only(top:20,bottom: 20, left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Target calories',
                        style: TextStyle(
                            fontSize: 20
                        ),),
                      Text('500 cal',
                        style: TextStyle(
                            fontSize: 20
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              Container(
                decoration: BoxDecoration(
                  color: pageColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black45),
                  boxShadow:  [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.8),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 5), // changes position of shadow
                    ),
                  ],

                ),
                child: Padding(
                  padding: const EdgeInsets.only(top:20,bottom: 20, left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Target weight',
                        style: TextStyle(
                            fontSize: 20
                        ),),
                      Text('63 kg',
                        style: TextStyle(
                            fontSize: 20
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                  boxShadow:  [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.8),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 5), // changes position of shadow
                    ),
                  ],
                ),
                width: MediaQuery.of(context).size.width*0.5,
                height: 40,
                child: OutlinedButton(

                  onPressed: () {
                    // Get.to(EditMyInfoScreen());
                  },
                  child: Row(
                    children: [
                      SizedBox(width: 50,),
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



            ],
          ),
        ),
      ),

    );
  }
}
