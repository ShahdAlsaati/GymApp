class UserModel {
 late String name;
 late String email;
 late String password;
 late  String cPassword;

  UserModel({required this.name, required this.email, required this.password, required this.cPassword});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    cPassword = json['c_password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['c_password'] = this.cPassword;
    return data;
  }
}