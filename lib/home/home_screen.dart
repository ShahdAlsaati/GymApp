import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gym/activity/activity_screen.dart';
import 'package:gym/info/information_screen.dart';
import 'package:gym/profile/profile_screen.dart';
import 'package:gym/setting/qr_code.dart';
import 'package:gym/style/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../BMI_Calculator/BMI_calculator_screen.dart';
import '../about_us/about_us_screen.dart';
import 'home_controller.dart';
import '../setting/setting_screen.dart';
import '../widget/custum_list_tile.dart';

class HomeScreen extends StatelessWidget {
  TapController crt=Get.put(TapController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(


      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.format_list_bulleted_sharp),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.brown,
          weight: 600,
          size: 30
        ),
        automaticallyImplyLeading: true,


        title: Text(

          'Home Screen',
          style: TextStyle(

              color: Colors.brown,
              fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor:Colors.orangeAccent.shade200,
        actions: [

          IconButton(onPressed:(){
            Get.to(QRCode());
          },
              icon: Icon(Icons.qr_code_2,
              color: Colors.brown,
              ))

        ],

      ),
      drawer: Drawer(

        child: ListView(

          children: [
            DrawerHeader(

              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [


                    pageColor,
                    Colors.white
                  ],
                ),
              ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.orange,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Shahd Alsaati',
                     // (crt.uesrName[0].name==null||crt.uesrName.isEmpty)?'...':crt.uesrName[0].name,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.brown
                      ),
                    ),

                  ],
                )

            ),
            CustumListTile(Icons.person, "profile", () {
              Get.to(ProfileScreen());
            }),
            CustumListTile(Icons.monitor_weight_outlined, "BMI Calculator", () {
              Get.to(BMICalculator());
            }),

            CustumListTile(Icons.question_mark_sharp, "About us", () {
              Get.to(AboutUsScreen());

            }),
            CustumListTile(Icons.settings, "Setting", () {
              Get.to(SettingScreen());
            }),

            CustumListTile(Icons.logout, "logout", () {
              crt.confirmSignOut();
            }),

            Image(
              fit: BoxFit.fill,
              image: AssetImage(
                  'assets/images/gym3.jpg'
              ),
            ),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(

          children: [
            SizedBox(
              height: 30,
            ),
            CarouselSlider(
              items:[
                Image(
                  image: AssetImage(
                      'assets/images/gymm.png'
                  ),width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Image(
                  image: AssetImage(
                      'assets/images/ad3.jfif'
                  ),
                  // width: double.infinity,
                  // fit: BoxFit.cover,
                ),
                Image(
                  image: AssetImage(
                      'assets/images/ad2.jfif'
                  ),
                  // width: double.infinity,
                  // fit: BoxFit.cover,
                ),

              ],
              options: CarouselOptions(
                height: 250,
                initialPage: 0,
                viewportFraction: 1,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval:Duration(seconds: 3) ,
                autoPlayAnimationDuration:Duration(seconds: 1),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,


              ),
            ),

            // Container(
            //   child: Image(
            //     image: AssetImage(
            //       'assets/images/gymm.png'
            //     ),
            //   ),
            //   width: double.infinity,
            //   height: 250,
            //   color: Colors.white,
            // ),
            SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context)=>ActivityScreen(),),);                },
                  child: Container(
                    child: const Center(
                      child: Column(
                        children: [
                          Image(
                            image: AssetImage(
                                'assets/images/fs.jpg',

                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Courses',
                            style: TextStyle(
                                fontFamily: 'Bookstory',

                                color:purpleColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 50
                            ),
                          ),
                        ],
                      ),
                    ),
                    width: 175,
                    height: 250,
                    color: Colors.white,
                  ),

                ),
                InkWell(
                  onTap: (){
                    Get.to(InformationScreen());
                    },

                  child: Container(
                    child: Column(
                  children: [
                  Image(
                  image: AssetImage(
                    'assets/images/hlsn.jfif',

                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'News ',
                  style: TextStyle(
                      fontFamily: 'Bookstory',

                      color: yellowColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 50
                  ),
                ),
              ],
            ),

          width: 175,

                    height: 250,
                    color: Colors.white,
                  ),
                ),
              ],
            )
          ],
          ),
        ),
      ),
    );
  }
}
