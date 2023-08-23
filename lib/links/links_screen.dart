import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:our_gym/style/colors.dart';
import 'package:our_gym/widget/links.dart';

import 'links_controller.dart';

class LinksScreen extends StatelessWidget {
List links=[  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
      padding: const EdgeInsets.only(top: 40),
      child: SingleChildScrollView(
        child: Column(
          children: [

           LinksWidget('https://www.jbsa.mil/News/News/Article/2170856/maintaining-balanced-lifestyle-key-to-staying-healthy/',
            'Maintaining balanced lifestyle key to staying healthy',
            'https://media.defense.gov/2020/Apr/30/2002291608/1920/1080/0/200501-F-PO640-0034.JPG'),
            LinksWidget('https://mymind.org/self-care-good-sleep-as-part-of-mental-health',
                'SELF-CARE: GOOD SLEEP AS PART OF MENTAL HEALTH RECOVERY',
                'https://mymind.org/image/posts/0853ea02-d1fe-4b54-9f95-4bbef32ad322.jpg'),

            LinksWidget('https://askthescientists.com/diet-vs-lifestyle/',
                'What is a Healthy Diet? How to Eat Based on Science',
                'https://askthescientists.com/wp-content/uploads/2019/06/AdobeStock_310581123-1.jpeg'),

            LinksWidget('https://slideplayer.com/slide/10889655/',
                'HEALTHY LIFESTYLE Erasmus +. 1. How to live? -It is important that you know how to live -Better lifestyle habits.',
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnvoIMyzH8NI9efSsTDmwDzqhQuvVhuS4PXZ5fosTI5So20CAKM2lAWf7xQ2bt3wx96po&usqp=CAU'),

            LinksWidget('https://wittysparks.com/ways-to-live-a-healthy-lifestyle/',
                'Traits to Ensure Better Health in 10 Years',
                'https://wittysparks.com/wp-content/uploads/2017/08/Healthy-Living-Healthy-Lifestyle.png'),


          ],
        ),
      )
    )
    );
  }
}
