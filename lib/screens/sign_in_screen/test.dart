import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gym/screens/sign_in_screen/sig_in_controller.dart';

class test extends StatelessWidget {
  const test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller=Get.put<SignInController>(SignInController());
    print("i am here");
    print(_controller.users.length);
    return Scaffold(
      appBar:AppBar(),
      body:FutureBuilder(
        future: _controller.getUsers(),
        builder: (context, snapshot){
          if(snapshot.connectionState==ConnectionState.waiting)
          {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          else
         return ListView.builder(
              itemCount: _controller.users.length,
              itemBuilder:(context, index)
              {

                return Padding(
                  padding:EdgeInsets.all(8),
                  child:Container(
                    width: 200,
                    height: 200,
                    color: Colors.blueAccent,
                    child: Center(
                      child: Text(
                          '${_controller.users[index].name}',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                );

              }
          );
        },
      ),
    );
  }
}
