import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gym/style/colors.dart';
import 'courses_controller.dart';

class CardioScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var _controller=Get.put<CoursesController>(CoursesController());

    print(_controller.cardio.length);

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
                    '''What Is Cardio?\n
Cardio exercise, which is sometimes referred to as aerobic exercise,
 is any rhythmic activity that raises your heart rate into your target heart rate zone. 
 This is the zone where you burn the most fat and calories.
Some of the most common examples of cardio include walking, cycling,and swimming. However, even household chores like vacuuming and mopping can qualify as cardio exercise.'''
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
                  future:_controller.getCardio() ,
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
                                _controller.confirmJoin(_controller.cardio[idx].cId);
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
                                        Text('Couch: ${_controller.cardio[idx].couchName}'),
                                        SizedBox(height: 6,),
                                        Text('Time: ${_controller.cardio[idx].time}'),
                                        SizedBox(height: 6,),
                                        Text('Days: ${_controller.cardio[idx].date}'),
                                        SizedBox(height: 6,),

                                        Row(
                                          children: [
                                            Text('Calories Burned: ${_controller.cardio[idx].caloriesBurned}'),
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
                          itemCount: _controller.cardio.length);
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
