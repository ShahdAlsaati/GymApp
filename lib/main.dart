import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gym/home/home_screen.dart';
import 'package:gym/screens/login_screen/login_screen.dart';
import 'package:gym/screens/on_boarding/on_boarding_sreen.dart';
import 'package:get/get.dart';
import 'package:gym/screens/sign_in_screen/sig_in_controller.dart';
import 'package:gym/shared/network/local/cache_helper.dart';
import 'package:gym/shared/network/remote/dio_helper.dart';

import 'db/db_helper.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDB();
  await GetStorage.init();
  await Firebase.initializeApp().then((value){
    Get.put(SignInController());
  });
  DioHelper.init();
  await CacheHelper.init();
  Widget widget;

  bool? onBoarding =CacheHelper.getData(key:'onBoarding');
  print(onBoarding);
  String? token = CacheHelper.getData(key:'token');
  print(token);
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


  runApp(MyApp(startWidget:onBoardingSreen() ));

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
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:  onBoardingSreen(),
    );
  }
}

