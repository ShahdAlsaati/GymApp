import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gym/style/colors.dart';

import '../home/home_controller.dart';
import 'courses_controller.dart';

class YogaScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var _controller=Get.put<CoursesController>(CoursesController());

    print(_controller.zumba.length);

    return Scaffold(
      backgroundColor: pageColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: pageColor,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          //  mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(

              decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.shade200,

                  border: Border.all(
                      color: Colors.black

                  )
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                    '''What is yoga?
Yoga is a Sanskrit word translated as “yoke” or “union.” To yoke means to draw together, to bind together; or to unite. Its aim is to yoke or create a union of the body, mind, soul, and universal consciousness.
 This process of uniting the physical, mental, emotional, and spiritual aspects of ourselves is what allows yogis to experience deep states of freedom,
  peace and self-realization.
Yoga is an ancient system of physical, mental and spiritual practices that have been 
passed down through the generations from teacher to student. Yogic practices include breathing techniques,
 postures, relaxation, chanting, and other meditation methods. There are many different styles of yoga, each with their own unique focus and approach
  to creating a unitive state.'''
                ),
              ),

              width: MediaQuery.of(context).size.width*0.95,
              height: 250,
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: GetBuilder<CoursesController>(
                init: CoursesController(),
                builder:(controller)=> FutureBuilder(
                  future:_controller.getYoga() ,
                  builder: (context,snapshot){
                    if(snapshot.connectionState==ConnectionState.waiting)
                    {
                      return Center(
                        child: Column(

                          children: [
                            SizedBox(
                              height: 100,
                            ),
                            CircularProgressIndicator(
                              color: Colors.orangeAccent,
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Text('Loading ....')
                          ],
                        ),
                      );
                    }
                    else
                      return ListView.separated(
                          itemBuilder:(context,idx){
                            return InkWell(
                              onTap: (){
                                _controller.confirmJoin(_controller.yoga[idx].cId);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Container(
                                  decoration: BoxDecoration(

                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.grey.shade200,

                                      border: Border.all(
                                          color: Colors.black

                                      )
                                  ),

                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Couch: ${_controller.yoga[idx].couchName}'),
                                        SizedBox(height: 6,),
                                        Text('Time: ${_controller.yoga[idx].time}'),
                                        SizedBox(height: 6,),
                                        Text('Days: ${_controller.yoga[idx].date}'),
                                        SizedBox(height: 6,),

                                        Row(
                                          children: [
                                            Text('Calories Burned: ${_controller.yoga[idx].caloriesBurned}'),
                                            Icon(Icons.local_fire_department_outlined,
                                              color: Colors.red,
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 6,),

                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context,idx){
                            return SizedBox(
                              height: 7,
                            );
                          },
                          itemCount: _controller.yoga.length);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
