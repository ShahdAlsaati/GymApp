class MyCources {
  late int myCID;
  CouecesModel? couecesModel;


  MyCources.fromJson(Map<String, dynamic> json) {
    myCID = json['myCID'];
    couecesModel = json['couecesModel'] != null ? new CouecesModel.fromJson(json['couecesModel']) : null;
  }

}
class CouecesModel{
  String? couchName;
  String? date;
  String? time;
  String? min;
  String? room;
  int? caloriesBurned;

  CouecesModel({
    this.couchName,
    this.date,
    this.time,
    this.min,
    this.room,
    this.caloriesBurned
  });
  CouecesModel.fromJson(Map<String,dynamic>?json){
    couchName=json!['couchName'];
    date=json['date'];
    time=json['time'];
    min=json['min'];
    room=json['room'];
    caloriesBurned=json['caloriesBurned'];

  }
  Map<String,dynamic>toMap(){
    return {
      'couchName':couchName,
      'date':date,
      'time':time,
      'min':min,
      'room':room,
      'caloriesBurned':caloriesBurned,


    };
  }

}