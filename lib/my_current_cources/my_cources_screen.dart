import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'my_cources_controller.dart';

class MyCoursesScreen extends  StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final MyCoursesController myCoursesController = Get.put(MyCoursesController());

    return Scaffold(
      appBar: AppBar(
        iconTheme:const IconThemeData(
          color: Colors.brown,
        ),
    //    automaticallyImplyLeading: false,
        backgroundColor: Colors.orangeAccent,
        title: Text(
          'My Courses',
          style: TextStyle(
            color: Colors.brown
          ),
        ),
        elevation: 0,
      ),
      body: GetBuilder<MyCoursesController>(
        init: MyCoursesController(),
        builder: (controller) {
          return FutureBuilder(
            future:myCoursesController.fetchData(),
            builder: (context,snapshot) {
              if (myCoursesController.courses==null) {
                return const Center(
                  child: Text(' You haven\'t enroll yet',),
                );
              }
              if(snapshot.connectionState==ConnectionState.waiting)
              {
                return  Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,

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
              return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: ListView.separated(
                        itemCount:myCoursesController.courses.length,
                        itemBuilder:(context,idx){
                          final course = myCoursesController.courses[idx];

                          return Padding(
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
                                    Text('Coach: ${course!.coach}'),
                                    const SizedBox(height: 6,),
                                    Text('Time: ${course.times}'),
                                    const SizedBox(height: 6,),
                                    Text('Days: ${course.weeksDays}'),
                                    const SizedBox(height: 6,),
                                    Text('duration: ${course.duration}'),
                                    const SizedBox(height: 6,),
                                    Row(
                                      children: [
                                        Text('Calories Burned: ${course.calories}'),
                                        const Icon(Icons.local_fire_department_outlined,
                                          color: Colors.red,
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 6,),

                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context,idx){
                          return const SizedBox(
                            height: 3,
                          );
                        },
                      )

                ),

              ],
            );
            },
          );
        },
      ),
    );
  }
}
