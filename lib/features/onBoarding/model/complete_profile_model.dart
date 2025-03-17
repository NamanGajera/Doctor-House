class CompleteProfileModel {
  int? statusCode;
  String? message;
  User? user;

  CompleteProfileModel({this.statusCode, this.message, this.user});

  CompleteProfileModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['gender'] = this.gender;
    data['mobileNumber'] = this.mobileNumber;
    data['age'] = this.age;
    data['profileImage'] = this.profileImage;
    data['role'] = this.role;
    data['isProfileCompleted'] = this.isProfileCompleted;
    return data;
  }
}
