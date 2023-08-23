



import 'package:get/get.dart';

import '../models/my_courses/my_courses.dart';
import '../shared/const/const.dart';
import 'my_cources_services.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:our_gym/shared/network/local/cache_helper.dart';


class MyCoursesController extends GetxController {
  MyCoursesServices services =MyCoursesServices();

  RxList<Course?> courses = <Course?>[].obs;

   fetchData() async {
    try {
      var headers = {
        'Authorization': 'Bearer ${CacheHelper.getData(key: 'token')}',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      };


      var request = http.Request('GET', Uri.parse('$ip/get/course/mycourses'));
      request.body = json.encode({
        "user_id": int.parse(CacheHelper.getData(key: 'id')),
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var ans =await response.stream.bytesToString();
        final jsonResponse = json.decode(ans);
        final myCourses = MyCoursesModel.fromJson(jsonResponse);

        courses.value = myCourses.data?.map((courseData) => courseData.course)?.toList() ?? [];

      } else {
        print(response.statusCode);
       }
    } catch (e) {
      print(e.toString());
    }
  }
}
