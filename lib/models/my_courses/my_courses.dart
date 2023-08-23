class MyCoursesModel {
  bool? success;
  List<Data>? data;
  String? message;

  MyCoursesModel({this.success, this.data, this.message});

  MyCoursesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
  }
}

class Data {
  int? id;
  int? userId;
  int? courseId;
  Course? course;

  Data({this.id, this.userId, this.courseId, this.course});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    courseId = json['course_id'];
    course =
    json['course'] != null ? new Course.fromJson(json['course']) : null;
  }

}

class Course {
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

  Course(
      {this.id,
        this.name,
        this.room,
        this.duration,
        this.weeksDays,
        this.calories,
        this.times,
        this.coach,
        this.createdAt,
        this.updatedAt});

  Course.fromJson(Map<String, dynamic> json) {
    id = json['id'];
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