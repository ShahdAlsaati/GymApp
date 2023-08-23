class HealthInfoModel {
  bool? success;
  Data? data;
  String? message;

  HealthInfoModel({this.success, this.data, this.message});

  HealthInfoModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String? age;
  int? asthma;
  int? familyHistory;
  int? heartDiseases;
  String? height;
  int? obesity;
  int? smoke;
  String? weight;
  String? gender;
  int? physActivity;
  int? veggies;
  int? stroke;
  String? cA;
  String? iron;
  String? bloodpPressure;
  int? userId;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.age,
        this.asthma,
        this.familyHistory,
        this.heartDiseases,
        this.height,
        this.obesity,
        this.smoke,
        this.weight,
        this.gender,
        this.physActivity,
        this.veggies,
        this.stroke,
        this.cA,
        this.iron,
        this.bloodpPressure,
        this.userId,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    age = json['age'];
    asthma = json['asthma'];
    familyHistory = json['familyHistory'];
    heartDiseases = json['heartDiseases'];
    height = json['height'];
    obesity = json['obesity'];
    smoke = json['smoke'];
    weight = json['weight'];
    gender = json['gender'];
    physActivity = json['PhysActivity'];
    veggies = json['Veggies'];
    stroke = json['Stroke'];
    cA = json['CA'];
    iron = json['Iron'];
    bloodpPressure = json['bloodpPressure'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['age'] = this.age;
    data['asthma'] = this.asthma;
    data['familyHistory'] = this.familyHistory;
    data['heartDiseases'] = this.heartDiseases;
    data['height'] = this.height;
    data['obesity'] = this.obesity;
    data['smoke'] = this.smoke;
    data['weight'] = this.weight;
    data['gender'] = this.gender;
    data['PhysActivity'] = this.physActivity;
    data['Veggies'] = this.veggies;
    data['Stroke'] = this.stroke;
    data['CA'] = this.cA;
    data['Iron'] = this.iron;
    data['bloodpPressure'] = this.bloodpPressure;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}