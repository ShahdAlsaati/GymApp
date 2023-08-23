import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:our_gym/shared/network/local/cache_helper.dart';

import '../shared/const/const.dart';

class CoursesServices extends GetxController {
  static CoursesServices get instance => Get.find();


  addCourse(int courseId)async {
    try{
    var headers = {
      'Authorization': 'Bearer ${CacheHelper.getData(key:'token')}',
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('$ip/add/course/mycourses'));
    request.body = json.encode({
      "user_id": int.parse(CacheHelper.getData(key: 'id')),
      "course_id": courseId
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      await Get.snackbar('success', 'enrolled successfully');
      print(await response.stream.bytesToString());
       Get.back();
    }
    else {
      print(response.reasonPhrase);
    } }
    catch (e) {
      print(e.toString());
      Get.snackbar('Error', 'An error occurred during enrolled');
    }
  }

}