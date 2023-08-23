import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gym/style/colors.dart';

import 'information_controller.dart';

class InformationScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var _controller=Get.put<InfoController>(InfoController());
    print(_controller.links.length);
    return Scaffold(
      backgroundColor: pageColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,

        backgroundColor:pageColor,
        elevation: 0,
      ),
      body: GetBuilder(
        init: InfoController(),
        builder: (controller)=>StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
          .collection('links').snapshots(),
          builder: (context,snapshot){
            if(snapshot.connectionState==ConnectionState.waiting)
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

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
            else
            return Padding(
              padding: const EdgeInsets.all(18.0),
              child: ListView.separated(
                separatorBuilder:(context,idx){
                  return SizedBox(
                    height: 15,
                  );
              },
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context,idx){

                  return InkWell(
                    onTap: (){
                      _controller.launchUrl(snapshot.data!.docs[idx]['link']);

                    },
                    child: Card(

                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      elevation: 5,
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      child: Stack(

                        alignment: AlignmentDirectional.bottomCenter,

                        children: [
                        Image(image: NetworkImage(
                          snapshot.data!.docs[idx]['urlImage'],
                        )),
                          Container(
                            color: Colors.black45,
                            height: 70,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width*0.6,
                                  child: Text(

                                    snapshot.data!.docs[idx]['phrase'],
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: TextStyle(
                                      color: Colors.white
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.chevron_right,
                                  color: Colors.white,
                                  size: 30,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )

                    );

                },

              ),
            );
          },
        ),
      )
    );
  }
}
// Container(
// decoration: BoxDecoration(
// color: idx%3==0?Colors.orangeAccent:idx%3==1?yellowColor:pageColor
// ),
// width: MediaQuery.of(context).size.width*0.9,
// height: MediaQuery.of(context).size.width*0.4,
// child: Center(
// child: Padding(
// padding: const EdgeInsets.all(10.0),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Container(
// width: MediaQuery.of(context).size.width*0.6,
// child: Text(
//
// snapshot.data!.docs[idx]['phrase'],
// maxLines:3,
// overflow: TextOverflow.clip,
// style: TextStyle(
// color: Colors.black,
// fontSize: 20,
//
// ),
// ),
// ),
// Icon(
// Icons.arrow_right,
// size: 30,
// )
// ],
// ),
// ),
// ),
// ),