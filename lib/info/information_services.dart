import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gym/models/links/links_model.dart';

import '../../models/users/users_models.dart';

class InfoServices{
  getink() async{
    List links=<Links>[];
    try{
      await FirebaseFirestore.instance
          .collection('links').get()
          .then((value){
        value.docs.forEach((element) {
          print(element.data()['link']);
          links.add(Links(
            link:element.data()['link'],
            phrase: element.data()['phrase']


          ));

        });
      });
      return links;
    }
    catch(e)
    {
      print(e.toString());
    }
  }



}