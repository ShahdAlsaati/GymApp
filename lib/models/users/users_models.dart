class UserModel{
  String? name;
  String? email;
  String? phone;
   String? uId;
  String ?age;
  String? gender;
  String ? long;
  String? weight;
  List<String>? cid;
  String ? address;

  UserModel({
    this.name,
    this.email,
    this.phone,
     this.uId,
     this.weight,
    // this.cover,
    this.age,
  this.long,
    this.cid,
    this.address
  });
  UserModel.fromJson(Map<String,dynamic>?json){
    name=json!['name'];
    email=json['email'];
    phone=json['phone'];
    uId=json['uId'];
    age=json['age'];
     gender=json['gender'];
    weight=json['weight'];
    cid = json['cid'].cast<String>();
    address = json['address'];



  }
  Map<String,dynamic>toMap(){
    return {
      'name':name,
      'email':email,
      'phone':phone,
      'uId':uId,
      'gender':gender,
       'weight':weight,
      'age':age,
      'cid':cid,
      'address':address
    };
  }



}