import 'package:get/get.dart';
import '../db/db_helper.dart';
import '../models/health_info/health_info_model.dart';
import 'edit_my_info_services.dart';


class EditMyInfoController extends GetxController{

  EditMyInfoServices services =EditMyInfoServices();

  void onReady()
  {
    super.onReady();
  }

  updateHealthForm({
    required String age,
    required  String height,
    required String weight,
    bool? smoke,
    bool? obesity,
    bool? heartDiseases,
    bool? familyHistory,
    bool? asthma,
  })async{
    await services.updateHealthForm(
      age: age,
      height: height,
      weight: weight,
      smoke: isChecked.value,
      obesity: isChecked2.value,
      heartDiseases: isChecked4.value,
      familyHistory: isChecked1.value,
      asthma:isChecked3.value,

    );
  }


  Future<int> updateHealthInfoToDB({
    required String age,
    required String height,
    required String weight,
 //   required String gender,
    bool? smoke,
    bool? obesity,
    bool? heartDiseases,
    bool? familyHistory,
    bool? asthma,
  }) async
  {
    print("hello");
    print("I am workinggggggggggggggggggggggggggggggggggggggggggggggggg");

    return await DBHelper.update(
        age:age,height:height,weight: weight, smoke: isChecked.value,obesity: isChecked2.value,
        heartDiseases: isChecked4.value,familyHistory: isChecked1.value,asthma: isChecked3.value);
  }


  var isChecked = false.obs;
  var isChecked1 = false.obs;
  var isChecked2 = false.obs;
  var isChecked3 = false.obs;
  var isChecked4 = false.obs;

  void toggle() {
    isChecked.value = !isChecked.value;

  }

  void toggle1() {
    isChecked1.value = !isChecked1.value;

  }

  void toggle2() {
    isChecked2.value = !isChecked2.value;

  }

  void toggle3() {
    isChecked3.value = !isChecked3.value;
  }

  void toggle4() {
    isChecked4.value = !isChecked4.value;

  }

  RxList healthInfo=[].obs;

  getHealthInfo() async {
    healthInfo.value = await services.getHealthInfo();
  }


}
