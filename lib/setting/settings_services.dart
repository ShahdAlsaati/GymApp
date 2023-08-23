import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';import '../../db/db_helper.dart';
import '../../models/users/users_models.dart';
import '../../shared/network/local/cache_helper.dart';

class SettingsServices{

  getUser() async{
    List user=<UserModel>[];
    try{
      await FirebaseFirestore.instance
          .collection('users').get()
          .then((value){
        value.docs.forEach((element) {
          print(element.data()['name']);
          user.add(UserModel(
            uId:element.data()['uid'],
            name: element.data()['name'],
            age: element.data()['age'],
            email: element.data()['email'],
            weight: element.data()['weight'],
            long: element.data()['long'],
            address: element.data()['address'],
            phone: element.data()['phone'],
          )
          );

        });
      });

      return user;
    }
    catch(e)
    {
      print('errrrrrrrrrrrroor');
      print(e.toString());
    }
  }

  updateUsers({
    required String name,
    required String email,
    required String phone,

    required String address

  }) async{
    try{
      String id=await FirebaseAuth.instance.currentUser!.uid;
      FirebaseFirestore.instance.collection('users')
          .doc(id).update(
          {
            'name':name,
            'email':email,
            'phone':phone,

            'uid':id,

            'address':address
          }
      );

    }catch(e)
    {
      print(e.toString());
      Get.snackbar('Error', 'error is $e');

    }
  }





}