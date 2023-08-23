import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gym/models/links/links_model.dart';
import 'package:gym/models/courses/courses_mobel.dart';

import '../../models/users/users_models.dart';
import '../shared/network/local/cache_helper.dart';

class CoursesServices{
  getZumba() async{
    List zumba=<CoursesModel>[];
    try{
      String id=await FirebaseFirestore.instance
          .collection('courses')
          .doc()
          .id
          .toString();
      await FirebaseFirestore.instance
          .collection('courses').where('courseName',isEqualTo: 'Zumba').get()
          .then((value){
        value.docs.forEach((element) {
          print(element.data()['couchName']);
          zumba.add(CoursesModel(
            courseName: 'Zumba',
            cId: element.data()['cId'],
            couchName:element.data()['couchName'],
            date:element.data()['date'],
            time:element.data()['time'],
            room:element.data()['room'],
            caloriesBurned:element.data()['caloriesBurned'],


          ));

        });
      });
      return zumba;
    }
    catch(e)
    {
      print(e.toString());
    }
  }

  getCardio() async{
    List cardio=<CoursesModel>[];
    try{
      String id=await FirebaseFirestore.instance
          .collection('courses')
          .doc()
          .id
          .toString();
      await FirebaseFirestore.instance
          .collection('courses').where('courseName',isEqualTo: 'Cardio').get()
          .then((value){
        value.docs.forEach((element) {
          print(element.data()['couchName']);
          cardio.add(CoursesModel(
            courseName: 'Cardio',
            cId: element.data()['cId'],
            couchName:element.data()['couchName'],
            date:element.data()['date'],
            time:element.data()['time'],
            room:element.data()['room'],
            caloriesBurned:element.data()['caloriesBurned'],


          ));

        });
      });
      return cardio;
    }
    catch(e)
    {
      print(e.toString());
    }
  }

  getFullBodyWeight() async{
    List fullBodyWeight=<CoursesModel>[];
    try{
      String id=await FirebaseFirestore.instance
          .collection('courses')
          .doc()
          .id
          .toString();
      await FirebaseFirestore.instance
          .collection('courses').where('courseName',isEqualTo: 'Full Body Weight').get()
          .then((value){
        value.docs.forEach((element) {
          print(element.data()['couchName']);
          fullBodyWeight.add(CoursesModel(
            courseName: 'Full Body Weight',
            cId: element.data()['cId'],
            couchName:element.data()['couchName'],
            date:element.data()['date'],
            time:element.data()['time'],
            room:element.data()['room'],
            caloriesBurned:element.data()['caloriesBurned'],


          ));

        });
      });
      return fullBodyWeight;
    }
    catch(e)
    {
      print(e.toString());
    }
  }

  getYoga() async{
    List yoga=<CoursesModel>[];
    try{
      String id=await FirebaseFirestore.instance
          .collection('courses')
          .doc()
          .id
          .toString();
      await FirebaseFirestore.instance
          .collection('courses').where('courseName',isEqualTo: 'Yoga').get()
          .then((value){
        value.docs.forEach((element) {
          print(element.data()['couchName']);
          yoga.add(CoursesModel(
            courseName: 'Yoga',
            cId: element.data()['cId'],
            couchName:element.data()['couchName'],
            date:element.data()['date'],
            time:element.data()['time'],
            room:element.data()['room'],
            caloriesBurned:element.data()['caloriesBurned'],


          ));

        });
      });
      return yoga;
    }
    catch(e)
    {
      print(e.toString());
    }
  }

  getWorkOut() async{
    List workOut=<CoursesModel>[];
    try{
      String id=await FirebaseFirestore.instance
          .collection('courses')
          .doc()
          .id
          .toString();
      await FirebaseFirestore.instance
          .collection('courses').where('courseName',isEqualTo: 'Workout').get()
          .then((value){
        value.docs.forEach((element) {
          print(element.data()['couchName']);
          workOut.add(CoursesModel(
            courseName: 'Workout',
            cId: element.data()['cId'],
            couchName:element.data()['couchName'],
            date:element.data()['date'],
            time:element.data()['time'],
            room:element.data()['room'],
            caloriesBurned:element.data()['caloriesBurned'],


          ));

        });
      });
      return workOut;
    }
    catch(e)
    {
      print(e.toString());
    }
  }


  Future<void> addCourses(String CoID) async {
    try {

      String id=await FirebaseAuth.instance.currentUser!.uid;
      print(id);
      FirebaseFirestore.instance.collection('users').doc(id).update(
        {
          'cid': FieldValue.arrayUnion([CoID]),
        });
    }
    catch(r)
    {
      print(r.toString());
    }
  }


}