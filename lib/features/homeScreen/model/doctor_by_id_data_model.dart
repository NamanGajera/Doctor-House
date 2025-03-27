import 'package:doctor_house/commonModel/doctor_details_data_model.dart';

class DoctorByCategoryIdDataModel {
  List<DoctorDetailsData>? doctorData;
  int? statusCode;

  DoctorByCategoryIdDataModel({this.doctorData, this.statusCode});

  DoctorByCategoryIdDataModel.fromJson(Map<String, dynamic> json) {
    if (json['doctorData'] != null) {
      doctorData = <DoctorDetailsData>[];
      json['doctorData'].forEach((v) {
        doctorData!.add(DoctorDetailsData.fromJson(v));
      });
    }
    statusCode = json['statusCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (doctorData != null) {
      data['doctorData'] = doctorData!.map((v) => v.toJson()).toList();
    }
    data['statusCode'] = statusCode;
    return data;
  }
}
