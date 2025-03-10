class CompleteProfileModel {
  int? statusCode;
  Data? data;
  String? message;

  CompleteProfileModel({this.statusCode, this.data, this.message});

  CompleteProfileModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String? id;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? gender;
  int? age;
  String? profileImageUrl;
  String? bloodGroup;
  List<String>? allergies;
  List<String>? medicalConditions;
  Null? emergencyContact;
  PrivacySettings? privacySettings;
  String? consentDate;

  Data(
      {this.id,
      this.firstName,
      this.lastName,
      this.phoneNumber,
      this.gender,
      this.age,
      this.profileImageUrl,
      this.bloodGroup,
      this.allergies,
      this.medicalConditions,
      this.emergencyContact,
      this.privacySettings,
      this.consentDate});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phoneNumber = json['phoneNumber'];
    gender = json['gender'];
    age = json['age'];
    profileImageUrl = json['profileImageUrl'];
    bloodGroup = json['bloodGroup'];

    // Convert JSON list to List<String>
    allergies = json['allergies'] != null ? List<String>.from(json['allergies']) : null;
    medicalConditions = json['medicalConditions'] != null ? List<String>.from(json['medicalConditions']) : null;

    emergencyContact = json['emergencyContact'];
    privacySettings = json['privacySettings'] != null ? PrivacySettings.fromJson(json['privacySettings']) : null;
    consentDate = json['consentDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['phoneNumber'] = phoneNumber;
    data['gender'] = gender;
    data['age'] = age;
    data['profileImageUrl'] = profileImageUrl;
    data['bloodGroup'] = bloodGroup;

    // Convert List<String> back to JSON format
    if (allergies != null) {
      data['allergies'] = allergies;
    }
    if (medicalConditions != null) {
      data['medicalConditions'] = medicalConditions;
    }

    data['emergencyContact'] = emergencyContact;
    if (privacySettings != null) {
      data['privacySettings'] = privacySettings!.toJson();
    }
    data['consentDate'] = consentDate;

    return data;
  }
}

class PrivacySettings {
  bool? dataSharing;
  bool? marketingCommunication;

  PrivacySettings({this.dataSharing, this.marketingCommunication});

  PrivacySettings.fromJson(Map<String, dynamic> json) {
    dataSharing = json['dataSharing'];
    marketingCommunication = json['marketingCommunication'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dataSharing'] = this.dataSharing;
    data['marketingCommunication'] = this.marketingCommunication;
    return data;
  }
}
