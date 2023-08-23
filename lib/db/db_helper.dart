import 'package:firebase_auth/firebase_auth.dart';
import 'package:sqflite/sqflite.dart';

import '../models/health_info/health_info_model.dart';

class DBHelper{
  static Database ?_db;
  static final int _version=1;
  static final String _tableName="healthInfo";

  static Future<void> initDB()async{
    print('I am in db');
    if(_db!=null)
      {
        return;
      }
    try{
      String _path = await getDatabasesPath() + 'healthInfo.db';
      _db = await openDatabase(
        _path,
        version: _version,
        onCreate: (db,version){
          print("database created");
          return db.execute(
            "Create table $_tableName("
                "age string , gender string , height string ,"
                " weight string , smoke bool,"
                "obesity bool, heartDiseases bool,"
                "familyHistory bool,asthma bool)"
          ).then((value) {
            print('create table');
          }).catchError((e){
            print('error is ${e.toString()}');

          });
        }

      );
      try {
        final List<Map<String, dynamic>> results = await _db!.query(_tableName);
        if (results.isNotEmpty) {
          results.forEach((row) {
            print(row);
          });
        } else {
          print("No data found");
        }
      } catch (e) {
        print("Error occurred: ${e.toString()}");
      }
    }
    catch(e)
    {
      print(e.toString());
    }

  }



  static Future<int> insert({

    required String age,
    required String height,
    required String weight,
    required String gender,
    bool? smoke,
    bool? obesity,
    bool? heartDiseases,
    bool? familyHistory,
    bool? asthma,

  }) async{
    print("insert function called heeeeeeeeeeeeeeeeeeeeeeeeeeeeere");

    return await _db?.insert(_tableName,{'age':age,'height':height,'weight':weight,'gender':gender,
      'smoke':(smoke==true)?1:0, 'obesity':(obesity==true)?1:0,'heartDiseases':(heartDiseases==true)?1:0,
          'familyHistory':(familyHistory==true)?1:0, 'asthma':(asthma==true)?1:0,
    }).then((value) {
      print('$value done');
    }).catchError((e){
      print("errrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrror");

      print(e.toString());
    })??8;
  }

  static Future<List<Map<String,dynamic>>> query() async{
    final insertedData = await _db!.query(_tableName);

    await _db!.close();
    return insertedData;
  }

  static delete(HealthInfoModel healthInfoModel)async{
   return await _db!.delete(_tableName, where: 'id=?' , whereArgs: [healthInfoModel.uId]);
  }

  static update( {
    required String age,
    required String height,
    required String weight,
  //  required String gender,
    bool? smoke,
    bool? obesity,
    bool? heartDiseases,
    bool? familyHistory,
    bool? asthma,
})async{
    return await _db!.update(
        _tableName,
        {'age':age,
          'height':height,'weight':weight,
          'smoke':(smoke==true)?1:0, 'obesity':(obesity==true)?1:0,'heartDiseases':(heartDiseases==true)?1:0,
          'familyHistory':(familyHistory==true)?1:0, 'asthma':(asthma==true)?1:0,}

        ).then((value) {
          print('updated successfully');
    });
  }

}