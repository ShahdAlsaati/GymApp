import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'BMI_calculator_services.dart';




class BMICalculatorController extends GetxController{

   BMICalculatorServices services =BMICalculatorServices();

   RxDouble height = 120.0.obs;

   changeH(double v) {
   height.value=v.obs.value;

   }

   RxDouble weight = 60.0.obs;

   changeW(double v) {
      weight.value=v.obs.value;

   }

}