import 'dart:ffi';
import 'dart:math';

import 'package:get/get.dart';

class Controller extends GetxController {

  RxInt c=20.obs;

  RxInt h = 150.obs;

  RxInt w = 60.obs;

  RxDouble bmiS=22.00.obs;

   calculateBmi() {

      bmiS.value = (w/ pow(h / 100, 2));
  }
  RxInt g = 0.obs;
  RxInt a = 30.obs;
  RxBool isFinished = false.obs;

  changeH (int h1)
  {

    h.value=h1;
  }
  changeW(int w1)
  {

    w.value=w1;
  }
  changeA (int a1)
  {
    a.value=a1;
  }
  changeG(int g1)
  {
    g.value=g1;
  }
  decreaseC()
  {
    c.value--;
  }
  increaseC()
  {
    c.value++;
  }
  changeIsF(bool b)
  {
    isFinished.value=b;
  }
}