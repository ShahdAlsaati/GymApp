import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:our_gym/All_courses/courses_services.dart';
import 'package:our_gym/home/home_screen.dart';
import 'package:our_gym/screens/login_screen/login_screen.dart';
import 'package:our_gym/screens/on_boarding/on_boarding_screen.dart';
import 'package:get/get.dart';

import 'package:our_gym/shared/network/local/cache_helper.dart';

import 'All_courses/courses_controller.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await CacheHelper.init();

  await CacheHelper.init();
  Widget widget;

  bool? onBoarding =CacheHelper.getData(key:'onBoarding');
  print("000000000000000000000000000000000000000000000000");
  print(onBoarding);
  String? token = CacheHelper.getData(key:'token');
   String? id = CacheHelper.getData(key:'id');
  String? name = CacheHelper.getData(key:'name');
  String? health_id = CacheHelper.getData(key:'health_id');
  print(token);
  print(health_id);
  print(name);

  print(id);
  if(onBoarding!=null){
    if(token!=null)
      widget=HomeScreen();
    else {
      widget = LoginScreen();
    }
  }
  else{
    widget=onBoardingSreen();
  }

  Get.put(CoursesServices());
  Get.put(CoursesController());


  runApp(MyApp(startWidget:widget ));

}

class MyApp extends StatelessWidget {
  final Widget startWidget;
  MyApp({
    required this.startWidget,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:  startWidget,
    );
  }
}

