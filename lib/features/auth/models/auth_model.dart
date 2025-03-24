class AuthModel {
  int? statusCode;
  String? token;
  User? user;

  AuthModel({this.statusCode, this.token, this.user});

  AuthModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    token = json['token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? id;
  String? name;
  String? email;
  bool? isProfileCompleted;

  User({this.id, this.name, this.email, this.isProfileCompleted});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    isProfileCompleted = json['isProfileCompleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['isProfileCompleted'] = this.isProfileCompleted;
    return data;
  }
}
