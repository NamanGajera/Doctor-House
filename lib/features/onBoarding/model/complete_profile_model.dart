class CompleteProfileModel {
  int? statusCode;
  String? message;
  User? user;

  CompleteProfileModel({this.statusCode, this.message, this.user});

  CompleteProfileModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['message'] = message;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  String? id;
  String? name;
  String? firstName;
  String? lastName;
  String? email;
  String? gender;
  String? mobileNumber;
  int? age;
  String? profileImage;
  String? role;
  bool? isProfileCompleted;

  User(
      {this.id,
      this.name,
      this.firstName,
      this.lastName,
      this.email,
      this.gender,
      this.mobileNumber,
      this.age,
      this.profileImage,
      this.role,
      this.isProfileCompleted});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    gender = json['gender'];
    mobileNumber = json['mobileNumber'];
    age = json['age'];
    profileImage = json['profileImage'];
    role = json['role'];
    isProfileCompleted = json['isProfileCompleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['gender'] = gender;
    data['mobileNumber'] = mobileNumber;
    data['age'] = age;
    data['profileImage'] = profileImage;
    data['role'] = role;
    data['isProfileCompleted'] = isProfileCompleted;
    return data;
  }
}
