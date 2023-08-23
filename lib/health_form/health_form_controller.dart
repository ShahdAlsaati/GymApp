import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';
import '../models/health_info/health_info_model.dart';
import '../shared/const/const.dart';
import 'health_form_services.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../shared/network/local/cache_helper.dart';

class HealthInfoController extends GetxController{

  RxString selectedGender="Gender".obs;
  RxList<String> genderList=[
    "male",
    "female",
  ].obs;


  HealthInfoServices services =HealthInfoServices();
  var isCheckedAsthma = false.obs;
  var isCheckedFamilyHistory = false.obs;
  var isCheckedHeartDiseases = false.obs;
  var isCheckedObesity = false.obs;
  var isCheckedSmoke = false.obs;
  var isCheckedPhysActivity = false.obs;
  var isCheckedVeggies = false.obs;
  var isCheckedStroke = false.obs;
  var isCheckedBloodPressure = false.obs;
  void toggleAsthma() {
    isCheckedAsthma.value = !isCheckedAsthma.value;

  }
  void toggleFamilyHistory() {
    isCheckedFamilyHistory.value = !isCheckedFamilyHistory.value;

  }
  void toggleHeartDiseases() {
    isCheckedHeartDiseases.value = !isCheckedHeartDiseases.value;

  }
  void toggleObesity() {
    isCheckedObesity.value = !isCheckedObesity.value;
  }
  void toggleSmoke() {
    isCheckedSmoke.value = !isCheckedSmoke.value;

  }
  void toggleStroke() {
    isCheckedStroke.value = !isCheckedStroke.value;
  }
  void togglePhysActivity() {
    isCheckedPhysActivity.value = !isCheckedPhysActivity.value;

  }
  void toggleVeggies() {
    isCheckedVeggies.value = !isCheckedVeggies.value;

  }
  void toggleBloodPressure() {
    isCheckedBloodPressure.value = !isCheckedBloodPressure.value;

  }

 editHealthInfo({
       required String age,
       required String height,
       required String weight,
       required String iron,
       required String ca,
       required String gender,
     })
 {
   services.editHealthInfo(age: age,
       height: height,
       weight: weight,
       iron: iron,
       ca: ca,
       gender: gender,
       asthma: isCheckedAsthma.value,
       familyHistory: isCheckedFamilyHistory.value,
       heartDiseases: isCheckedHeartDiseases.value,
       obesity: isCheckedObesity.value,
       smoke: isCheckedSmoke.value,
       physActivity: isCheckedPhysActivity.value,
       veggies: isCheckedVeggies.value,
       stroke: isCheckedStroke.value,
       bloodPressure: isCheckedBloodPressure.value);
 }

  updateList(){
    update();
    fetchData();
  }

  RxBool isLoading = true.obs;
  Rx<HealthInfoModel> healthInfo = HealthInfoModel().obs;

  fetchData() async {
    try {
      isLoading(true);
      final response = await http.get(
        Uri.parse('$ip/health_form/${CacheHelper.getData(key: 'health_id')}'),
        headers: <String, String>{
          'Authorization': 'Bearer ${CacheHelper.getData(key: 'token')}',
          'Accept': 'application/json',
          'Content-Type': 'text/plain'
        },
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        print("Response Body: $jsonData");
        healthInfo.value = HealthInfoModel.fromJson(jsonData);

        if (healthInfo.value.data != null) {
          final data = healthInfo.value.data!;

          isCheckedAsthma.value = data.asthma == 1;
          isCheckedFamilyHistory.value = data.familyHistory == 1;
          isCheckedHeartDiseases.value = data.heartDiseases == 1;
          isCheckedObesity.value = data.obesity == 1;
          isCheckedSmoke.value = data.smoke == 1;
          isCheckedPhysActivity.value = data.physActivity == 1;
          isCheckedVeggies.value = data.veggies == 1;
          isCheckedStroke.value = data.stroke == 1;
          isCheckedBloodPressure.value = data.bloodpPressure == 1;

          selectedGender.value = data.gender ?? '';

          // You can continue setting other values here...
        } else {
          print("Data is null in the response");
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print(error.toString());
    } finally {
      isLoading(false);
    }
  }


  void onReady(){
    super.onReady();
  }

  @override
  void onInit() async {

    super.onInit();
    fetchData();
  }



}