import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gym/style/colors.dart';

import '../home/home_controller.dart';
import 'courses_controller.dart';

class ZumbaScreen extends StatelessWidget {
  const ZumbaScreen({Key? key}) : super(key: key);

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
                  '''What is Zumba?
Zumba's most well-known and popular program is its namesake class, Zumba.\n
 This dance class features high- and low-intensity intervals that help improve cardiovascular fitness while also enhancing balance,
  coordination, agility, and to some degree, strength through the application of beginner-accessible choreography.'''
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
                  future:_controller.getZumba() ,
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
                              _controller.confirmJoin(_controller.zumba[idx].cId);
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
                                      Text('Couch: ${_controller.zumba[idx].couchName}'),
                                      SizedBox(height: 6,),
                                      Text('Time: ${_controller.zumba[idx].time}'),
                                      SizedBox(height: 6,),
                                      Text('Days: ${_controller.zumba[idx].date}'),
                                      SizedBox(height: 6,),

                                      Row(
                                        children: [
                                          Text('Calories Burned: ${_controller.zumba[idx].caloriesBurned}'),
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
                        itemCount: _controller.zumba.length);
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
