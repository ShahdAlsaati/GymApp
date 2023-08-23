class CoursesModel{
  String ? cId;
  String? courseName;
  String? couchName;
  String? date;
  String? time;
  String? min;
  String? room;
  String? caloriesBurned;

  CoursesModel({
    this.cId,
    this.courseName,
    this.couchName,
    this.date,
    this.time,
    this.min,
    this.room,
    this.caloriesBurned
  });
  CoursesModel.fromJson(Map<String,dynamic>?json){
    cId=json!['cId'];
    courseName=json['courseName'];
    couchName=json['couchName'];
    date=json['date'];
    time=json['time'];
    min=json['min'];
    room=json['room'];
    caloriesBurned=json['caloriesBurned'];

  }
  Map<String,dynamic>toMap(){
    return {
      'cId':cId,
      'courseName':courseName,
      'couchName':couchName,
      'date':date,
      'time':time,
      'min':min,
      'room':room,
      'caloriesBurned':caloriesBurned,


    };
  }

}