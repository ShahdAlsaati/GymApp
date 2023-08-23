import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym/setting/settings_controller.dart';

class SettingScreen extends StatelessWidget {
   TextEditingController _emailController=TextEditingController(text: '');
   TextEditingController _nameController=TextEditingController(text: '');
   TextEditingController _phoneController=TextEditingController(text: '');
   TextEditingController _addressController=TextEditingController(text: '');
  var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SettingsController crt=Get.put(SettingsController());

    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading:false,
        iconTheme: IconThemeData(
          color: Colors.brown
        ),
        backgroundColor: Colors.orange,
        title: Text(
          'Settings',
          style: TextStyle(
            color: Colors.brown,
            fontWeight: FontWeight.bold
          ),
        ),

      ),
      body: GetBuilder<SettingsController>(
          init:SettingsController(),
        builder: (controller)=>FutureBuilder(
          future:  crt.getUser(),
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
              if(crt.uesrData.isEmpty)
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
              else{
                _emailController=TextEditingController(text: crt.uesrData[0].email??'');
                _phoneController=TextEditingController(text:crt.uesrData[0].phone??'');
                _nameController=TextEditingController(text: crt.uesrData[0].name??'');
                _addressController=TextEditingController(text: crt.uesrData[0].address??'');

                return Padding(
            padding: const EdgeInsets.all(18.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person,
                        color: Colors.brown,),
                      hintText: 'Name',
                      labelText: 'Name *',
                      hintStyle: TextStyle(
                          color: Colors.brown

                      ),
                      labelStyle: TextStyle(
                          color: Colors.brown

                      ),
                    ),
                    controller: _nameController,
                    onSaved: (String? value) {
                      // This optional block of code can be used to run
                      // code when the user saves the form.
                    },
                    validator: (String? value) {
                      // return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
                    },
                  ),
                  SizedBox(height: 10,),

                  TextFormField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.email,
                        color: Colors.brown,),
                      hintText: 'Email',
                      labelText: 'Email *',
                      hintStyle: TextStyle(
                          color: Colors.brown

                      ),
                      labelStyle: TextStyle(
                          color: Colors.brown

                      ),
                    ),
                    controller: _emailController,
                    onSaved: (String? value) {
                      // This optional block of code can be used to run
                      // code when the user saves the form.
                    },
                    validator: (String? value) {
                      //  return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
                    },
                  ),
                  SizedBox(height: 10,),

                  TextFormField(
                    controller: _phoneController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        icon: Icon(Icons.phone,
                          color: Colors.brown,),
                        hintText: 'Phone',
                        labelText: 'Phone *',
                        hintStyle: TextStyle(
                            color: Colors.brown

                        ),
                        labelStyle: TextStyle(
                            color: Colors.brown

                        )
                    ),
                    onSaved: (String? value) {
                      // This optional block of code can be used to run
                      // code when the user saves the form.
                    },
                    validator: (String? value) {
                    },
                  ),
                  SizedBox(height: 10,),


                  TextFormField(
                    controller: _addressController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.location_city, color: Colors.brown,),
                      hintText: 'Address',
                      labelText: 'Address *',


                      hintStyle: TextStyle(
                          color: Colors.brown

                      ),
                      labelStyle: TextStyle(
                          color: Colors.brown

                      ),

                    ),
                    onSaved: (String? value) {
                      // This optional block of code can be used to run
                      // code when the user saves the form.
                    },
                    validator: (String? value) {
                    },
                  ),
                  SizedBox(height: 20,),
                  Container(
                    width: MediaQuery.of(context).size.width*0.7,
                    height: 40,
                    child: OutlinedButton(

                      onPressed: () {
                        crt.updateUser(name: _nameController.text, email: _emailController.text,
                            address: _addressController.text,phone: _phoneController.text);
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

                ],
              ),
            ),
          );}
            },
        ),


      ),

    );
  }
}
