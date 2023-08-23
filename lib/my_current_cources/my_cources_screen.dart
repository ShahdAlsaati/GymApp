import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'my_cources_controller.dart';

class MyCourcesScreen extends StatelessWidget {
  const MyCourcesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller=Get.put<MyCourcesController>(MyCourcesController());

    print(_controller.currZumba.length);
    return Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading:false,
        title: Text(
          'My Courses',
          style: TextStyle(
            color: Colors.brown
          ),
        ),
        backgroundColor: Colors.orangeAccent,
      ),
       body:GetBuilder<MyCourcesController>(
        init: MyCourcesController(),
        builder:(controller)=> FutureBuilder(
          future:_controller.getcurrZumba() ,
          builder: (context,snapshot){


            if(snapshot.connectionState==ConnectionState.waiting)
            {
              return Center(
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
              return ListView.separated(
                  itemBuilder:(context,idx){
                    return InkWell(
                      onTap: (){
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
                                Text('Course Name: ${_controller.currZumba[idx].courseName}'),
                                SizedBox(height: 6,),
                                Text('Couch: ${_controller.currZumba[idx].couchName}'),
                                SizedBox(height: 6,),
                                Text('Time: ${_controller.currZumba[idx].time}'),
                                SizedBox(height: 6,),
                                Text('Days: ${_controller.currZumba[idx].date}'),
                                SizedBox(height: 6,),

                                Row(
                                  children: [
                                    Text('Calories Burned: ${_controller.currZumba[idx].caloriesBurned}'),
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
                  itemCount: _controller.currZumba.length);
          },
        ),
      ),
    );
  }
}
