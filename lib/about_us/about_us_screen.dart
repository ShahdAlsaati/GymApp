import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:our_gym/style/colors.dart';
import 'package:our_gym/widget/map.dart';

class AboutUsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(

              image: AssetImage(
                'assets/images/gym8.jpg',

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                'Opening hours',
                style: TextStyle(

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Text(
                      'Monday - Friday'
                  ),
                  Text(
                      '09:00 AM - 12:00AM'
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Text(
                      'Saturday - Sunday'
                  ),
                  Text(
                      '08:00 AM - 11:00AM'
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      'Telephone'
                  ),
                  Text(
                      '0965783997387'
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Text(
                      'Email'
                  ),
                  Text(
                      'gymapp@gmail.com'
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                      'Location'
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  InkWell(
                    onTap: (){
                      Get.to(Maps());
                    },
                    child: Image(
                        image: AssetImage(
                      'assets/images/location.jpg'
                    )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
