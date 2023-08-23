import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../models/health_info/health_info_model.dart';
import '../shared/network/local/cache_helper.dart';

class HealthInfoServices{

  getHealthInfo() async{
    List healthInfo=<HealthInfoModel>[];
    try{
      String id=await FirebaseAuth.instance.currentUser!.uid;

      await FirebaseFirestore.instance
          .collection('healthForm').where('uId',isEqualTo: id).get()
          .then((value){
        value.docs.forEach((element) {
          healthInfo.add(HealthInfoModel(
              age:element.data()['age'],
              height: element.data()['height'],
            weight: element.data()['weight'],
            smoke: element.data()['smoke'],
            heartDiseases: element.data()['heartDiseases'],
            familyHistory:  element.data()['familyHistory'],
            obesity: element.data()['obesity'],
            asthma: element.data()['asthma'],



          ));

        });
      });
      return healthInfo;
    }
    catch(e)
    {
      print(e.toString());
    }
  }

  addHealthForm({
     String? age,
     String? height,
     String? weight,
    bool? smoke,
    bool? obesity,
    bool? heartDiseases,
    bool? familyHistory,
    bool?   asthma,

  }) async{
    try{
      String id=await FirebaseAuth.instance.currentUser!.uid;
      FirebaseFirestore.instance.collection('healthForm')
          .doc(id).set(
          {
            'uId':id,
            'age':age,
            'weight':weight,
            'height':height,
            'smoke':smoke,
            'obesity':obesity,
            'heartDiseases':heartDiseases,
            'familyHistory':familyHistory,
            'asthma':asthma,

          }
      );

    }catch(e)
    {
      print(e.toString());
      Get.snackbar('Error', 'error is $e');

    }
  }


}