class CourseModel {
  bool? success;
  List<Data>? data;
  String? message;

  CourseModel({this.success, this.data, this.message});

  CourseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = List<Data>.from(json['data'].map((x) => Data.fromJson(x)));
    }
    message = json['message'];
  }
}

class Data {
  int? id;
  String? name;
  String? room;
  String? duration;
  String? weeksDays;
  String? calories;
  String? times;
  String? coach;
  String? createdAt;
  String? updatedAt;

  Data({
    this.id,
    this.name,
    this.room,
    this.duration,
    this.weeksDays,
    this.calories,
    this.times,
    this.coach,
    this.createdAt,
    this.updatedAt,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id=json['id'];
    name = json['name'];
    room = json['room'];
    duration = json['duration'];
    weeksDays = json['weeks_days'];
    calories = json['calories'];
    times = json['times'];
    coach = json['coach'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
