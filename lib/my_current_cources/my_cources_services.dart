

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/courses/courses_mobel.dart';


class MyCoursesServices{
  Future<List<CoursesModel>> getCurrCourses() async {
    try{
      List<CoursesModel> courses = <CoursesModel>[];
      final users = await FirebaseFirestore.instance.collection('users').get();
      for (final user in users.docs) {
        print(user.data()['cid']);
        final cidList = user.data()['cid'];
        for (int i = 0; i < cidList.length; i++) {
          print(cidList[i]);
          final coursesSnapshot = await FirebaseFirestore.instance
              .collection('courses')
              .where('cId', isEqualTo: cidList[i])
              .get();
          coursesSnapshot.docs.forEach((element) {
            print(element.data()['cId']);
            print('Hiiiiiiiiiiiiiiiiiiiiiiiiiii');
            courses.add(CoursesModel(
              courseName: element.data()['courseName'],
              cId: element.data()['cId'],
              couchName: element.data()['couchName'],
              date: element.data()['date'],
              time: element.data()['time'],
              room: element.data()['room'],
              caloriesBurned: element.data()['caloriesBurned'],
            ));
            print(courses.length);
          });
        }
      }
      print("I am here  $courses");

      return courses;

    }
    catch(e) {
      print(e.toString());
      return [];
    }
  }
}
