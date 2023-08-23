import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../models/courses/courses_mobel.dart';
import 'courses_controller.dart';

class CoursesScreen extends  StatelessWidget {

   String name;
   String longText;
  CoursesScreen(this.name, this.longText);

  @override
  Widget build(BuildContext context) {
    final CoursesController coursesController = Get.find();
    Future.delayed(Duration.zero, () {
      coursesController.fetchData(name: name);
    });
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: GetBuilder<CoursesController>(
      init:CoursesController(),
      builder: (controller)=>FutureBuilder(
        future:coursesController.fetchData(name: name) ,
          builder: (context,snapshot)
          {
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
              {
                return Container(
                  child: Column(
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
                        child:  Padding(
                          padding: EdgeInsets.all(18.0),
                          child:
                          Text(
                            '$longText',
                          ),
                        ),

                        width: MediaQuery.of(context).size.width*0.95,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: Obx(()
                        {
                          if (coursesController.isLoading.value) {
                            return Center(child: CircularProgressIndicator(
                              color: Colors.brown,
                            ));
                          }
                          else {
                            return ListView.separated(
                              itemCount:coursesController.courses.length,
                              itemBuilder:(context,idx){
                                Data course = coursesController.courses[idx];

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
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('Coach: ${course.coach}'),
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
                                          SizedBox(
                                            width: 110,
                                          ),
                                          Container(
                                            color: Colors.black,
                                            width: 2,
                                            height:130,
                                            child: Transform.rotate(
                                              angle: 80,

                                            ),
                                          ),
                                          InkWell(
                                            onTap: (){

                                              print(course.id);
                                              coursesController.confirmJoin(course.id!);

                                            },
                                            child: Container(
                                              child: RotatedBox(
                                                quarterTurns: 3,
                                                child: const Text(
                                                  'enroll',
                                                  style: TextStyle(
                                                      fontSize: 35,
                                                      color: Colors.orange,
                                                      fontWeight: FontWeight.bold

                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
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
                            );
                          }
                        },
                        ),
                      ),

                    ],
                  ),
                );
              }
          }
      )

      )

    );
  }
}
