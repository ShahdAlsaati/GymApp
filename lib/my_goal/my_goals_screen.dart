import 'package:flutter/material.dart';
import 'package:our_gym/shared/network/local/cache_helper.dart';

import '../style/colors.dart';

class MyGoalScreen extends StatelessWidget {
  TextEditingController _weigthNowController=TextEditingController(text: CacheHelper.getData(key: 'weight')??'');
  TextEditingController _targetWeightController=TextEditingController(text: CacheHelper.getData(key: 'targetWeight')??'');
  TextEditingController _targetCalController=TextEditingController(text: CacheHelper.getData(key: 'cal')??'');

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
          padding: const EdgeInsets.only(right: 18.0,left: 18,top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),

              Text("Weight : ",
                style: TextStyle(
                    color: Colors.brown,
                    fontSize: 15
                ),),
              TextFormField(
                controller: _weigthNowController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(

                  hintText:  '',
                  hintStyle: TextStyle(
                      color: Colors.black
                  ),
                  labelStyle: TextStyle(
                      color: Colors.black

                  ),
                ),


              ),
              SizedBox(height: 10,),
              Text("Target Weight : ",
                style: TextStyle(
                    color: Colors.brown,
                    fontSize: 15
                ),),
              TextFormField(
                controller: _targetWeightController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText:  '',
                  hintStyle: TextStyle(
                      color: Colors.black

                  ),
                  labelStyle: TextStyle(
                      color: Colors.black

                  ),
                ),


              ),
              SizedBox(height: 10,),

              Text("Target Calories : ",
                style: TextStyle(
                    color: Colors.brown,
                    fontSize: 15
                ),),
              TextFormField(
                controller: _targetCalController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText:  '',
                    hintStyle: TextStyle(
                        color: Colors.black

                    ),
                    labelStyle: TextStyle(
                        color: Colors.black)
                ),

              ),
              SizedBox(height: 25,),
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.7,
                  height: 40,
                  child: OutlinedButton(

                    onPressed: ()async {
                      await CacheHelper.saveData(key: 'weight', value: _weigthNowController.text.toString());
                      await CacheHelper.saveData(key: 'targetWeight', value: _targetWeightController.text.toString());
                      await CacheHelper.saveData(key: 'cal', value: _targetCalController.text.toString());
                      print('done');

                    },
                    child: Row(
                      children: [
                        SizedBox(width: 80,),
                        Text('Set', style: TextStyle(
                            color: Colors.brown
                        ),),
                        SizedBox(width: 10,),
                        Icon(
                          Icons.check,
                          size: 16,
                          color: Colors.brown,
                        ),
                      ],
                    ),

                  ),
                ),
              ),
            ],
          ),
        )
      ),

    );
  }
}
