import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller.dart';

class AgeWeightWidget extends StatelessWidget {
  final Function(int) onChange;

  final String title;

  final int initValue;

  final int min;

  final int max;

   AgeWeightWidget(
      {Key? key,
        required this.onChange,
        required this.title,
        required this.initValue,
        required this.min,
        required this.max})
      : super(key: key);

  Controller controller =Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(()=> Container(
              color: Colors.white,
              child: Column(children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 20, color: Colors.grey),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        child: const CircleAvatar(
                          radius: 12,
                          backgroundColor: Colors.orange,
                          child: Icon(Icons.remove, color: Colors.white),
                        ),
                        onTap: () {

                            if (controller.c > min) {
                              controller.decreaseC();
                            }

                         // widget.onChange(controller.c.value);
                        },
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        controller.c.value.toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      InkWell(
                        child: const CircleAvatar(
                          radius: 12,
                          backgroundColor: Colors.orange,
                          child: Icon(Icons.add, color: Colors.white),
                        ),
                        onTap: () {

                            if (controller.c.value < max) {
                            controller.increaseC();
                            }

                        //  widget.onChange(controller.c.value);
                        },
                      ),
                    ],
                  ),
                )
              ])),
        ));
  }
}