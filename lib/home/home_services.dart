
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';import '../../db/db_helper.dart';
import '../../models/users/users_models.dart';
import '../../shared/network/local/cache_helper.dart';

class HomeServices{
  getName() async{
    List name=<UserModel>[];
    try{
      String id=await FirebaseAuth.instance.currentUser!.uid;

      await FirebaseFirestore.instance
          .collection('users').where('uid',isEqualTo: id).get()
          .then((value){
        value.docs.forEach((element) {
          print(element.data()['name']);
          name.add(UserModel(
            name: element.data()['name'],
          )
          );

        });
      });

      return name;
    }
    catch(e)
    {
      print('errrrrrrrrrrrroor');
      print(e.toString());
    }
  }


}