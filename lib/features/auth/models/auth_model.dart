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
  ProfileImage? profileImage;

  User({
    this.id,
    this.name,
    this.email,
    this.isProfileCompleted,
    this.profileImage,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    isProfileCompleted = json['isProfileCompleted'];
    profileImage = json['profileImage'] != null ? new ProfileImage.fromJson(json['profileImage']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['isProfileCompleted'] = isProfileCompleted;
    if (this.profileImage != null) {
      data['profileImage'] = this.profileImage!.toJson();
    }
    return data;
  }
}

class ProfileImage {
  String? url;
  String? publicId;

  ProfileImage({this.url, this.publicId});

  ProfileImage.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    publicId = json['publicId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['publicId'] = this.publicId;
    return data;
  }
}
