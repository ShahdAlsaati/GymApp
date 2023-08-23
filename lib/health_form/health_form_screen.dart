import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'health_form_controller.dart';

class HealthFormScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  TextEditingController _ageController=TextEditingController(text: '');
  TextEditingController _heightController=TextEditingController(text: '');
  TextEditingController _weightController=TextEditingController(text: '');
  TextEditingController _genderController=TextEditingController(text: '');
  TextEditingController _CAController=TextEditingController(text: '');
  TextEditingController _IronController=TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    HealthInfoController _controller = Get.put(HealthInfoController());


    return Scaffold(
      appBar:  AppBar(
        iconTheme:const IconThemeData(
          color: Colors.brown,
        ),
        title:  const Text(
          'My HealthForm Screen',
            style: TextStyle(
            color: Colors.brown,
        ),

      ),
        backgroundColor: Colors.orangeAccent,
      ),
      body: GetBuilder<HealthInfoController>(
          init:HealthInfoController(),
          builder: (controller)=>FutureBuilder(
              future: _controller.fetchData(),
              builder: (context,snapshot)
          {
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
            else if(_controller.healthInfo.value.data!=null)
              {

              print('from hooon');
              var data =_controller.healthInfo.value.data;
              _ageController=TextEditingController(text:data!.age??'');
              _heightController=TextEditingController(text:data.height??'');
              _weightController=TextEditingController(text:data.weight??'');
              _genderController=TextEditingController(text:data.gender??'');
              _CAController=TextEditingController(text:data.cA??'' );
              _IronController=TextEditingController(text:data.iron??'');
            return  Padding(
              padding: EdgeInsets.all(18.0),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Age : ",
                        style: TextStyle(
                            color: Colors.brown,
                            fontSize: 15
                        ),),
                      TextFormField(
                        controller: _ageController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(

                          hintText: data?.age ?? '',
                          hintStyle: TextStyle(
                              color: Colors.black
                          ),
                          labelStyle: TextStyle(
                              color: Colors.black

                          ),
                        ),


                      ),
                      SizedBox(height: 10,),
                      Text("Weight : ",
                        style: TextStyle(
                            color: Colors.brown,
                            fontSize: 15
                        ),),
                      TextFormField(
                        controller: _weightController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: data?.weight ?? '',
                          hintStyle: TextStyle(
                              color: Colors.black

                          ),
                          labelStyle: TextStyle(
                              color: Colors.black

                          ),
                        ),


                      ),
                      SizedBox(height: 10,),

                      Text("Height : ",
                        style: TextStyle(
                            color: Colors.brown,
                            fontSize: 15
                        ),),
                      TextFormField(
                        controller: _heightController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: data?.height ??  '',
                            hintStyle: TextStyle(
                                color: Colors.black

                            ),
                            labelStyle: TextStyle(
                                color: Colors.black)
                        ),

                      ),
                      SizedBox(height: 10,),

                      Text("Gender : ",
                        style: TextStyle(
                            color: Colors.brown,
                            fontSize: 15
                        ),),
                      Obx(()=> TextFormField(
                          controller: _genderController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: _controller.selectedGender.value,
                            hintStyle: TextStyle(
                                color: Colors.black

                            ),
                            suffixIcon:DropdownButton(
                              icon: Icon(Icons.keyboard_arrow_down,
                                color: Colors.grey,
                              ),
                              iconSize: 32,
                              elevation: 4,
                              underline: Container(height: 0,),
                              items: _controller.genderList.map<DropdownMenuItem<String>>((String? value)
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
                                print(newValue);
                                  _controller.selectedGender.value=newValue!;
                                  //_controller.update();

                              },
                            ),

                            labelStyle: TextStyle(
                                color: Colors.brown
                            ),),

                        ),
                      ),
                      SizedBox(height: 10,),
                      Text("CA : ",
                        style: TextStyle(
                            color: Colors.brown,
                            fontSize: 15
                        ),),

                      TextFormField(
                        controller: _CAController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: data?.cA ?? ' ',

                          hintStyle: TextStyle(
                              color: Colors.black

                          ),
                          labelStyle: TextStyle(
                              color: Colors.black
                          ),),

                      ),
                      SizedBox(height: 10,),
                      Text("Iron : ",
                        style: TextStyle(
                            color: Colors.brown,
                            fontSize: 15
                        ),),

                      TextFormField(
                        controller: _IronController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: data?.iron ?? '',
                          hintStyle: TextStyle(
                              color: Colors.black

                          ),
                          labelStyle: TextStyle(
                              color: Colors.black
                          ),),

                      ),
                      SizedBox(height: 15,),

                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment
                              .spaceBetween,
                          children: [
                            Text('Family history with overweight',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.brown
                              ),),
                            Obx(()=> Checkbox(
                                  value:_controller.isCheckedFamilyHistory.value,


                                  onChanged: (v) {
                                    _controller.toggleFamilyHistory();
                                  }),
                            ),
                            // Text(' '),
                          ],
                        ),
                      ),
                      SizedBox(height: 15,),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment
                              .spaceBetween,
                          children: [
                            Text('Asthma',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.brown
                              ),),
                            Obx(()=> Checkbox(
                                  value:_controller.isCheckedAsthma.value,
                                  onChanged: (v) {
                                    _controller.toggleAsthma();
                                  }),
                            ),
                            // Text(' '),
                          ],
                        ),
                      ),

                      SizedBox(height: 15,),

                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment
                              .spaceBetween,
                          children: [
                            Text('Heart Diseases',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.brown
                              ),),
                            Obx(()=> Checkbox(
                                  value:_controller.isCheckedHeartDiseases.value,
                                  onChanged: (v) {
                                    _controller.toggleHeartDiseases();
                                  }),
                            ),
                            // Text(' '),
                          ],
                        ),
                      ),

                      SizedBox(height: 15,),

                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment
                              .spaceBetween,
                          children: [
                            Text('Obesity',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.brown
                              ),),
                            Obx(()=> Checkbox(
                                  value:_controller.isCheckedObesity.value,
                                  onChanged: (v) {
                                    _controller.toggleObesity();
                                  }),
                            ),
                            // Text(' '),
                          ],
                        ),
                      ),

                      SizedBox(height: 15,),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment
                              .spaceBetween,
                          children: [
                            Text('Smoke',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.brown
                              ),),
                            Obx(()=> Checkbox(
                                  value:_controller.isCheckedSmoke.value,
                                  onChanged: (v) {
                                    _controller.toggleSmoke();
                                  }),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15,),
                       Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment
                                .spaceBetween,
                            children: [
                              Text('PhysActivity',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.brown
                                ),),
                              Obx(()=> Checkbox(
                                    value:_controller.isCheckedPhysActivity.value,
                                    onChanged: (v) {
                                      _controller.togglePhysActivity();
                                    }),
                              ),
                            ],
                          ),
                        ),


                      SizedBox(height: 15,),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment
                              .spaceBetween,
                          children: [
                            Text('Veggies',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.brown
                              ),),
                            Obx(()=> Checkbox(
                                  value: _controller.isCheckedVeggies.value,
                                  onChanged: (v) {
                                    _controller.toggleVeggies();
                                  }),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15,),

                      Obx(()=>Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment
                                .spaceBetween,
                            children: [
                              Text('Stroke',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.brown
                                ),),
                              Checkbox(
                                  value: _controller.isCheckedStroke.value,
                                  onChanged: (v) {
                                    _controller.toggleStroke();
                                  }),
                              // Text(' '),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 15,),


                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment
                              .spaceBetween,
                          children: [
                            Text('blood Pressure',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.brown
                              ),),
                            Obx(()=> Checkbox(
                                  value:_controller.isCheckedBloodPressure.value,
                                  onChanged: (v) {
                                    _controller.toggleBloodPressure();
                                  }),
                            ),
                            // Text(' '),
                          ],
                        ),
                      ),


                      SizedBox(height: 20,),
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

                              print(_ageController.text.toString());
                              print(_weightController.text.toString());
                              print(_CAController.text.toString());
                              await _controller.editHealthInfo(
                                age: _ageController.text.toString(),
                                weight: _weightController.text.toString(),
                                height: _heightController.text.toString(),
                                gender: _controller.selectedGender.value,
                                ca: _CAController.text.toString(),
                                iron: _IronController.text.toString(),
                              );
                            },
                            child: Row(
                              children: [
                                SizedBox(width: 80,),
                                Text('Update', style: TextStyle(
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
                ),
              ),
            );}
            else{
              print('from heeeeeeeeeeeeeeeeer');

              return  Padding(
                padding: EdgeInsets.all(18.0),
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Age : ",
                          style: TextStyle(
                              color: Colors.brown,
                              fontSize: 15
                          ),),
                        TextFormField(
                          controller: _ageController,
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
                        Text("Weight : ",
                          style: TextStyle(
                              color: Colors.brown,
                              fontSize: 15
                          ),),
                        TextFormField(
                          controller: _weightController,
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

                        Text("Height : ",
                          style: TextStyle(
                              color: Colors.brown,
                              fontSize: 15
                          ),),
                        TextFormField(
                          controller: _heightController,
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
                        SizedBox(height: 10,),

                        Text("Gender : ",
                          style: TextStyle(
                              color: Colors.brown,
                              fontSize: 15
                          ),),
                        Obx(()=> TextFormField(
                          controller: _genderController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: _controller.selectedGender.value,
                            hintStyle: TextStyle(
                                color: Colors.black

                            ),
                            suffixIcon:DropdownButton(
                              icon: Icon(Icons.keyboard_arrow_down,
                                color: Colors.grey,
                              ),
                              iconSize: 32,
                              elevation: 4,
                              underline: Container(height: 0,),
                              items: _controller.genderList.map<DropdownMenuItem<String>>((String? value)
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
                                print(newValue);
                                _controller.selectedGender.value=newValue!;
                                //_controller.update();

                              },
                            ),

                            labelStyle: TextStyle(
                                color: Colors.black
                            ),),

                        ),
                        ),
                        SizedBox(height: 10,),
                        Text("CA : ",
                          style: TextStyle(
                              color: Colors.brown,
                              fontSize: 15
                          ),),

                        TextFormField(
                          controller: _CAController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText:  ' ',

                            hintStyle: TextStyle(
                                color: Colors.black

                            ),
                            labelStyle: TextStyle(
                                color: Colors.black
                            ),),

                        ),
                        SizedBox(height: 10,),
                        Text("Iron : ",
                          style: TextStyle(
                              color: Colors.brown,
                              fontSize: 15
                          ),),

                        TextFormField(
                          controller: _IronController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: '',
                            hintStyle: TextStyle(
                                color: Colors.black

                            ),
                            labelStyle: TextStyle(
                                color: Colors.black
                            ),),

                        ),
                        SizedBox(height: 15,),

                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment
                                .spaceBetween,
                            children: [
                              Text('Family history with overweight',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.brown
                                ),),
                              Obx(()=> Checkbox(
                                  value:_controller.isCheckedFamilyHistory.value,


                                  onChanged: (v) {
                                    _controller.toggleFamilyHistory();
                                  }),
                              ),
                              // Text(' '),
                            ],
                          ),
                        ),
                        SizedBox(height: 15,),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment
                                .spaceBetween,
                            children: [
                              Text('Asthma',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.brown
                                ),),
                              Obx(()=> Checkbox(
                                  value:_controller.isCheckedAsthma.value,
                                  onChanged: (v) {
                                    _controller.toggleAsthma();
                                  }),
                              ),
                              // Text(' '),
                            ],
                          ),
                        ),

                        SizedBox(height: 15,),

                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment
                                .spaceBetween,
                            children: [
                              Text('Heart Diseases',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.brown
                                ),),
                              Obx(()=> Checkbox(
                                  value:_controller.isCheckedHeartDiseases.value,
                                  onChanged: (v) {
                                    _controller.toggleHeartDiseases();
                                  }),
                              ),
                              // Text(' '),
                            ],
                          ),
                        ),

                        SizedBox(height: 15,),

                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment
                                .spaceBetween,
                            children: [
                              Text('Obesity',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.brown
                                ),),
                              Obx(()=> Checkbox(
                                  value:_controller.isCheckedObesity.value,
                                  onChanged: (v) {
                                    _controller.toggleObesity();
                                  }),
                              ),
                              // Text(' '),
                            ],
                          ),
                        ),

                        SizedBox(height: 15,),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment
                                .spaceBetween,
                            children: [
                              Text('Smoke',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.brown
                                ),),
                              Obx(()=> Checkbox(
                                  value:_controller.isCheckedSmoke.value,
                                  onChanged: (v) {
                                    _controller.toggleSmoke();
                                  }),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15,),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment
                                .spaceBetween,
                            children: [
                              Text('PhysActivity',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.brown
                                ),),
                              Obx(()=> Checkbox(
                                  value:_controller.isCheckedPhysActivity.value,
                                  onChanged: (v) {
                                    _controller.togglePhysActivity();
                                  }),
                              ),
                            ],
                          ),
                        ),


                        SizedBox(height: 15,),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment
                                .spaceBetween,
                            children: [
                              Text('Veggies',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.brown
                                ),),
                              Obx(()=> Checkbox(
                                  value: _controller.isCheckedVeggies.value,
                                  onChanged: (v) {
                                    _controller.toggleVeggies();
                                  }),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15,),

                        Obx(()=>Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment
                                .spaceBetween,
                            children: [
                              Text('Stroke',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.brown
                                ),),
                              Checkbox(
                                  value: _controller.isCheckedStroke.value,
                                  onChanged: (v) {
                                    _controller.toggleStroke();
                                  }),
                              // Text(' '),
                            ],
                          ),
                        ),
                        ),

                        SizedBox(height: 15,),


                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment
                                .spaceBetween,
                            children: [
                              Text('blood Pressure',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.brown
                                ),),
                              Obx(()=> Checkbox(
                                  value:_controller.isCheckedBloodPressure.value,
                                  onChanged: (v) {
                                    _controller.toggleBloodPressure();
                                  }),
                              ),
                              // Text(' '),
                            ],
                          ),
                        ),


                        SizedBox(height: 20,),
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

                                print(_ageController.text.toString());
                                print(_weightController.text.toString());
                                print(_CAController.text.toString());
                                await _controller.editHealthInfo(
                                  age: _ageController.text.toString(),
                                  weight: _weightController.text.toString(),
                                  height: _heightController.text.toString(),
                                  gender: _controller.selectedGender.value,
                                  ca: _CAController.text.toString(),
                                  iron: _IronController.text.toString(),
                                );
                              },
                              child: Row(
                                children: [
                                  SizedBox(width: 80,),
                                  Text('Update', style: TextStyle(
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
                  ),
                ),
              );
            }
          })
      )
    );

  }
}
