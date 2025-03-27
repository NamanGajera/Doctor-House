class AuthModel {
  int? statusCode;
  String? token;
  User? user;

  AuthModel({this.statusCode, this.token, this.user});

  AuthModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    token = json['token'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['token'] = token;
    if (user != null) {
      data['user'] = user!.toJson();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['isProfileCompleted'] = isProfileCompleted;
    return data;
  }
}
