import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:our_gym/screens/sign_in_screen/sig_in_services.dart';
import 'package:url_launcher/url_launcher.dart';

import 'links_services.dart';


class InfoController extends GetxController{

  InfoServices services =InfoServices();



  void launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      Get.snackbar(
        "Error",
        "Could not launch $url",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}