import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:our_gym/shared/network/local/cache_helper.dart';

import '../models/health_info/health_info_model.dart';
import '../shared/const/const.dart';

class HealthInfoServices{

  Future<void> editHealthInfo({
    required String age,
    required String height,
    required String weight,
    required String iron,
    required String ca,
    required String gender,
    required bool asthma,
    required bool familyHistory,
    required bool heartDiseases,
    required bool obesity,
    required bool smoke,
    required bool physActivity,
    required bool veggies,
    required bool stroke,
    required bool bloodPressure,
  }) async {
    try {
      var headers = {
        'Authorization': 'Bearer ${CacheHelper.getData(key: 'token')}',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      };

      var request = http.Request(
        'PUT',
        Uri.parse(
            '$ip/health_form/${CacheHelper.getData(key: 'health_id')}'),
      );
      request.body = json.encode({
        "age": "46",
        "asthma": true,
        "familyHistory": true,
        "heartDiseases": false,
        "height": "163",
        "obesity": false,
        "smoke": false,
        "weight": "80",
        "gender": "male",
        "PhysActivity": true,
        "Veggies": true,
        "Stroke": false,
        "CA": "8-12",
        "Iron": "100-105",
        "bloodpPressure": 1,
        "user_id": 2
      });
      request.body = json.encode({
        "age": age,
        "asthma": asthma,
        "familyHistory": familyHistory,
        "heartDiseases": heartDiseases,
        "height": height,
        "obesity": obesity,
        "smoke": smoke,
        "weight": weight,
        "gender": gender,
        "PhysActivity": physActivity,
        "Veggies": veggies,
        "Stroke": stroke,
        "CA": ca,
        "Iron": iron,
        "bloodpPressure":bloodPressure,
        "user_id": int.parse(CacheHelper.getData(key: 'id')),
      });
      print('age $age');
      print('asthma $asthma');
      print('familyHistory $familyHistory');
      print('height $height');
      print('gender $gender');
      print('smoke $smoke');
      print('heartDiseases $heartDiseases');
      print('obesity $obesity');
      print('weight $weight');

      print('ca $ca');
      print('stroke $stroke');
      print('physActivity $physActivity');
      print('veggies $veggies');

      print('iron $iron');
      print('bloodPressure $bloodPressure');
      print('user_id' + CacheHelper.getData(key: 'id'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print("Update Success");
        await Get.snackbar('Success', 'Updated Successfully');
      } else {
        print('Response Reason Phrase: ${response.reasonPhrase}');
        await Get.snackbar('Error', 'Failed to update information');
      }
    } catch (e) {
      print(e.toString());
      Get.snackbar('Error', 'An error occurred while updating information');
    }
  }



}