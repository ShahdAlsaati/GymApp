import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:our_gym/All_courses/courses_services.dart';
import 'package:our_gym/shared/network/local/cache_helper.dart';

import '../models/courses/courses_mobel.dart';
import '../shared/const/const.dart';

class CoursesController extends GetxController {
  CoursesServices services =CoursesServices();

  RxBool isLoading = true.obs;
  RxList<Data> courses = <Data>[].obs;

   fetchData({required String name}) async {
    try {
      isLoading(true);
      final response = await http.get(
        Uri.parse('$ip/user/course/$name'),
        headers: <String, String>{
          'Authorization': 'Bearer ${CacheHelper.getData(key: 'token')}',
          'Accept': 'application/json',
          'Content-Type': 'text/plain'
        },
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final coursesModel = CourseModel.fromJson(jsonData);

        courses.assignAll(coursesModel.data!);
      } else {
        throw Exception('Failed to load courses');
      }
    } catch (error) {
      print(error.toString());
    } finally {
      isLoading(false);
    }
  }

  addCourse(int courseId)async{
    await  services.addCourse(courseId);
  }

  confirmJoin(int courseId){
    Get.defaultDialog(
      title: 'enroll this course',
      middleText: 'Are you sur??',
      textCancel: 'cancel',
      textConfirm: 'confirm',
      buttonColor:Colors.orange,
      confirmTextColor: Colors.black,
      cancelTextColor: Colors.black,
      onConfirm: () async {
       await addCourse(courseId);

      },
      radius: 30,

    );
  }
}
