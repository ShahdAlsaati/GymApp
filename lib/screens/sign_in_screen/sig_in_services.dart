import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';import '../../db/db_helper.dart';
import '../../models/users/users_models.dart';
import '../../shared/network/local/cache_helper.dart';

class SignInServices{

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





          )

          );

        });
      });

    }
    catch(e)
    {
      print(e.toString());
    }
  }

  addUsers({
    required String name,
    required String email,
    required String password,
    required String gender,
    required String height,
    required String weight,
    required String age,
    required String address,
    required String phone,

  }) async{
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      String id=await FirebaseAuth.instance.currentUser!.uid;
      FirebaseFirestore.instance.collection('users')
      .doc(id).set(
        {
          'name':name,
          'email':email,
          'gender':gender,
          'long':height,
          'weight':weight,
          'uid':id,
          'age':age,
          'cid': FieldValue.arrayUnion([]),
          'address':address,
          'phone':phone,
        }
      );
    await  CacheHelper.saveData(key: 'uId', value: id);
    await createHealthForm(id: id, height: height, weight: weight,age: age, phone: phone);

    }catch(e)
  {
    print(e.toString());
    Get.snackbar('Error', 'error is $e');

  }
}

  createHealthForm({
    required String id,
    required String age,
    required String height,
    required String weight,
    required String phone,
    bool? smoke,
    bool? obesity,
    bool? heartDiseases,
    bool? familyHistory,
    bool?   asthma,

  }) async{
    try{
      FirebaseFirestore.instance.collection('healthForm')
          .doc(id).set(
          {
            'uId':id,
            'height':height??'0',
            'smoke':smoke??false,
            'weight':weight??'0',
            'age':age??'0',
            'obesity':obesity??false,
            'heartDiseases':heartDiseases??false,
            'familyHistory':familyHistory??false,
            'asthma':asthma??false

          }
      );

    }catch(e)
    {
      print(e.toString());
      Get.snackbar('Error', 'error is $e');

    }
  }



}