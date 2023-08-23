



import 'package:get/get.dart';

import 'my_cources_services.dart';


class MyCourcesController extends GetxController{

  MyCoursesServices services =MyCoursesServices();

  updateList(){
    update();
  }

  RxList currZumba=[].obs;

  getcurrZumba() async{
    currZumba.value= await services.getCurrCourses();

  }


}