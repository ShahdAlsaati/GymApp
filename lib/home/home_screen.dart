import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:our_gym/activity/activity_screen.dart';
import 'package:our_gym/health_form/health_form_screen.dart';
import 'package:our_gym/my_current_cources/my_cources_screen.dart';
import 'package:our_gym/screens/login_screen/login_controller.dart';
import 'package:our_gym/setting/qr_code.dart';
import 'package:our_gym/shared/network/local/cache_helper.dart';
import 'package:our_gym/style/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../BMI_Calculator/BMI_calculator_screen.dart';
import '../about_us/about_us_screen.dart';
import '../links/links_screen.dart';
import '../my_goal/my_goals_screen.dart';
import '../widget/custum_list_tile.dart';

class HomeScreen extends StatelessWidget {
  LoginController crt=Get.put(LoginController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(


      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.format_list_bulleted_sharp),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.brown,
          weight: 600,
          size: 30
        ),
        automaticallyImplyLeading: true,


        title: const Text(

          'Home Screen',
          style: TextStyle(

              color: Colors.brown,
              fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor:Colors.orangeAccent.shade200,
        actions: [

          IconButton(onPressed:(){
            Get.to(const QRCode());
          },
              icon: const Icon(Icons.qr_code_2,
              color: Colors.brown,
              ))

        ],

      ),
      drawer: Drawer(


        child: Padding(
          padding:  EdgeInsets.only(top: 6.0),
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(

                                '${CacheHelper.getData(key: 'name')}',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.brown
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(

                                '${CacheHelper.getData(key: 'email')}',
                                style: TextStyle(
                                    color: Colors.brown
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: const Image(
                              width: 120,
                              height: 90,
                              fit: BoxFit.cover,
                              image: AssetImage(
                                  'assets/images/hhhh.png'
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )

              ),

              CustumListTile(Icons.person, "profile", () {
                Get.to(HealthFormScreen());
              }),
              CustumListTile(Icons.sports_martial_arts_sharp, "My Goals", () {
                Get.to(MyGoalScreen());
              }),

              CustumListTile(Icons.sports_handball, "My Coursers", () {
                Get.to(MyCoursesScreen());
              }),
              CustumListTile(Icons.monitor_weight_outlined, "BMI Calculator", () {
                Get.to(const BMICalculator());
              }),

              CustumListTile(Icons.question_mark_sharp, "About us", () {
                Get.to(AboutUsScreen());

              }),
              // CustumListTile(Icons.settings, "Setting", () {
              //   Get.to(SettingScreen());
              // }),

              CustumListTile(Icons.logout, "logout", ()  {
                crt.confirmSignOut();


              }),

              const Image(
                fit: BoxFit.fill,
                image: AssetImage(
                    'assets/images/home1.png'
                ),
              ),
            ],
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(

          children: [
            const SizedBox(
              height: 30,
            ),
            CarouselSlider(
              items:[
                const Image(
                  image: AssetImage(
                      'assets/images/gymm.png'
                  ),width: double.infinity,
                  fit: BoxFit.cover,
                ),
                const Image(
                  image: AssetImage(
                      'assets/images/ad3.jfif'
                  ),width: double.infinity,
                  fit: BoxFit.cover,
                  // width: double.infinity,
                  // fit: BoxFit.cover,
                ),
                const Image(
                  image: AssetImage(
                      'assets/images/ad2.jfif'
                  ),
                  width: double.infinity,
                  fit: BoxFit.cover,
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
                autoPlayInterval:const Duration(seconds: 3) ,
                autoPlayAnimationDuration:const Duration(seconds: 1),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,


              ),
            ),


            const SizedBox(height: 20,),

            Column(
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
                                'assets/images/gymCourses.jpg',

                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),

                          Text(
                            'Courses',
                            style: TextStyle(
                                // fontFamily: 'Bookstory',

                                color:purpleColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 30
                            ),
                          ),
                        ],
                      ),
                    ),
                    width: double.infinity,
                    color: Colors.white,
                  ),

                ),
                const SizedBox(height: 10,),
                InkWell(
                  onTap: (){
                    Get.to(LinksScreen());
                    },

                  child: Container(
                    child: const Column(
                  children: [
                  Image(
                  image: AssetImage(
                    'assets/images/healthNews.jpg',

                  ),
                ),
                    SizedBox(
                      height: 3,
                    ),
                Text(
                  'Health news ',
                  style: TextStyle(
                      // fontFamily: 'Bookstory',

                      color: yellowColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 30
                  ),
                ),
              ],
            ),

                    width: double.infinity,

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
