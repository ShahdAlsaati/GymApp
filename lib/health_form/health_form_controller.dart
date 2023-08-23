import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';
import '../db/db_helper.dart';
import '../models/health_info/health_info_model.dart';
import 'health_form_services.dart';


class HealthInfoController extends GetxController{

  HealthInfoServices services =HealthInfoServices();
  var isChecked = false.obs;
  var isChecked1 = false.obs;
  var isChecked2 = false.obs;
  var isChecked3 = false.obs;
  var isChecked4 = false.obs;

  void toggle() {
    isChecked.value = !isChecked.value;
    services.addHealthForm(
      smoke: isChecked.value,
        familyHistory: isChecked1.value,
        obesity: isChecked2.value,
        asthma: isChecked3.value,
        heartDiseases: isChecked4.value,
    );
  }
  void toggle1() {
    isChecked1.value = !isChecked1.value;
    services.addHealthForm(
      smoke: isChecked.value,
      familyHistory: isChecked1.value,
      obesity: isChecked2.value,
      asthma: isChecked3.value,
      heartDiseases: isChecked4.value,    );
  }
  void toggle2() {
    isChecked2.value = !isChecked2.value;
    services.addHealthForm(

      smoke: isChecked.value,
      familyHistory: isChecked1.value,
      obesity: isChecked2.value,
      asthma: isChecked3.value,
      heartDiseases: isChecked4.value,    );
  }
  void toggle3() {
    isChecked3.value = !isChecked3.value;
    services.addHealthForm(
      smoke: isChecked.value,
      familyHistory: isChecked1.value,
      obesity: isChecked2.value,
      asthma: isChecked3.value,
      heartDiseases: isChecked4.value,    );
  }
  void toggle4() {
    isChecked4.value = !isChecked4.value;
    services.addHealthForm(
      smoke: isChecked.value,
      familyHistory: isChecked1.value,
      obesity: isChecked2.value,
      asthma: isChecked3.value,
      heartDiseases: isChecked4.value,    );
  }

  updateList(){
    update();
  }

  RxList healthInfo=[].obs;

  getHealthInfoFromFireBase() async {
    healthInfo.value = await services.getHealthInfo();

  }

  void onReady(){
    super.onReady();
  }

  @override
  void onInit() async {

    super.onInit();
    fetchData();


  }
  getDataFromDB()
  async {
    List<Map<String,dynamic>> results =await DBHelper.query();
    healthInfo.addAll(results.map((row) => HealthInfoModel.fromJson(row)));

    print(results);
    print('hhhhhhhhhhhhhhhhhhhhiiiiiiiiiiiiiii');
  }


  Future<void> fetchData() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      // No internet connection, use data from local database
      getDataFromDB();
      print('i am in local database');
      }
     else {
      // Internet connection available, use data from Firebase
      getHealthInfoFromFireBase();
      print('i am in firebase');

    }
  }


}