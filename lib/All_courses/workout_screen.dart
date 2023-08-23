import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gym/style/colors.dart';

import 'courses_controller.dart';

class WorkOutScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var _controller=Get.put<CoursesController>(CoursesController());

    print(_controller.workout.length);

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
                    '''What is Workout?\n
A workout is a physical exercise routine that is designed to improve or maintain fitness levels, build strength, increase endurance, or achieve specific health and fitness goals. Workouts can consist of a variety of exercises and movements, such as weightlifting, cardio, yoga, pilates, and more. They can be performed at a gym, fitness center, outdoors, or in the comfort of your own home.

Workouts can range from beginner-level to advanced-level and can be customized to fit individual fitness goals, preferences, and physical abilities. Some people prefer to follow pre-designed workout plans or fitness programs, while others prefer to design their own workouts based on their specific goals and needs.'''
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
                  future:_controller.getWorkout() ,
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
                                _controller.confirmJoin(_controller.workout[idx].cId);
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
                                        Text('Couch: ${_controller.workout[idx].couchName}'),
                                        SizedBox(height: 6,),
                                        Text('Time: ${_controller.workout[idx].time}'),
                                        SizedBox(height: 6,),
                                        Text('Days: ${_controller.workout[idx].date}'),
                                        SizedBox(height: 6,),

                                        Row(
                                          children: [
                                            Text('Calories Burned: ${_controller.workout[idx].caloriesBurned}'),
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
                          itemCount: _controller.workout.length);
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
