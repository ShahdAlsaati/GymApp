import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ruler_picker_bn/ruler_picker_bn.dart';

import '../controller.dart';

class HeightWidget extends StatelessWidget {
  final Function(int) onChange;

   HeightWidget({Key? key, required this.onChange}) : super(key: key);

  Controller controller =Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Obx(()=> Padding(
        padding: const EdgeInsets.all(18.0),
        child: Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20,),

                    Padding(
                      padding: const EdgeInsets.only(top:8.0,left: 19,),
                      child: const Text(
                        "Height",
                        style: TextStyle(fontSize: 25, color: Colors.grey),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 19),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            controller.h.value.toString(),
                            style: const TextStyle(fontSize: 40),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "cm",
                            style: TextStyle(fontSize: 20, color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: RotatedBox(
                        quarterTurns: 3,
                        child: Container(
                          width: 400,
                          height: 80,
                          child: RulerPicker(
                            onChange: (value) {
                              controller.changeH(value);
                              controller.update();
                              },
                            background: Colors.white,
                            lineColor: Colors.black,
                            direction: Axis.horizontal,
                            startValue: 70,
                            maxValue: 200,
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
          Container(
              child:  Image(
                  image: AssetImage(
                    'assets/images/height.jpg',

                  ),
               ),),
              ],
            )),
      ),
    );
  }
}