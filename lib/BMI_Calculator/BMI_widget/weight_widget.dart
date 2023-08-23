import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ruler_picker_bn/ruler_picker_bn.dart';

import '../controller.dart';

class WeightWidget extends StatefulWidget {
  final Function(int) onChange;

  const WeightWidget({Key? key, required this.onChange}) : super(key: key);

  @override
  _WeightWidgetState createState() => _WeightWidgetState();
}

class _WeightWidgetState extends State<WeightWidget> {
  Controller controller =Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Obx(()=> Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20,),

                const Text(
                  "Weight",
                  style: TextStyle(fontSize: 25, color: Colors.grey),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      controller.w.value.toString(),
                      style: const TextStyle(fontSize: 40),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "kg",
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    )
                  ],
                ),
                Container(
                  width: 500,
                  height: 80,
                  child: RulerPicker(
                    onChange: (value) {
                  controller.changeW(value);
                  controller.update();
                    },
                    background: Colors.white,
                    lineColor: Colors.black,
                    direction: Axis.horizontal,
                    startValue: 55,
                    maxValue: 200,
                  ),
                ),

              ],
            )),
      ),
    );
  }
}