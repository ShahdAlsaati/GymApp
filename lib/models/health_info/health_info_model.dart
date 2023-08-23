
class HealthInfoModel{


  String? uId;
  String ?age;
  String? gender;
  String ? height;
  String? weight;
  bool? smoke;
  bool? obesity;
  bool? heartDiseases;
  bool? familyHistory;
  bool? asthma;



  HealthInfoModel({

    this.uId,
    this.gender,
    this.weight,
    this.age,
    this.height,
    this.familyHistory,
    this.heartDiseases,
    this.obesity,
    this.smoke,
    this.asthma,

  });
  HealthInfoModel.fromJson(Map<String,dynamic>?json){
    uId = json!['uId'] is String ? json['uId'] : json['uId'].toString();
    height=json['height'] is String ? json['height'] : json['height'].toString();;
    age=json['age']is String ? json['age'] : json['age'].toString();
    gender=json['gender']is String ? json['gender'] : json['gender'].toString();
    weight=json['weight']is String ? json['weight'] : json['weight'].toString();
    familyHistory=json['familyHistory']== 1 ? true : false;
    heartDiseases=json['heartDiseases']== 1 ? true : false;
    obesity=json['obesity']== 1 ? true : false;
    smoke=json['smoke']== 1 ? true : false;
    asthma=json['asthma']== 1 ? true : false;

  }
  Map<String,dynamic>toMap(){
    return {
      'height':height,
      'uId':uId,
      'gender':gender,
      'weight':weight,
      'age':age,
      'familyHistory':familyHistory,
      'heartDiseases':heartDiseases,
      'obesity':obesity,
      'smoke':smoke,
      'asthma':asthma,
    };
  }


}