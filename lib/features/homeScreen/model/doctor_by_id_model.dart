import 'package:doctor_house/commonModel/doctor_details_data_model.dart';

class DoctorByIdModel {
  DoctorDetailsData? doctorData;
  int? statusCode;

  DoctorByIdModel({this.doctorData, this.statusCode});

  DoctorByIdModel.fromJson(Map<String, dynamic> json) {
    doctorData = json['doctorData'] != null ? DoctorDetailsData.fromJson(json['doctorData']) : null;
    statusCode = json['statusCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (doctorData != null) {
      data['doctorData'] = doctorData!.toJson();
    }
    data['statusCode'] = statusCode;
    return data;
  }
}
