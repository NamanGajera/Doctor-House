import 'package:doctor_house/commonModel/doctor_details_data_model.dart';

class DoctorByCategoryIdDataModel {
  List<DoctorDetailsData>? doctorData;
  int? statusCode;

  DoctorByCategoryIdDataModel({this.doctorData, this.statusCode});

  DoctorByCategoryIdDataModel.fromJson(Map<String, dynamic> json) {
    if (json['doctorData'] != null) {
      doctorData = <DoctorDetailsData>[];
      json['doctorData'].forEach((v) {
        doctorData!.add(new DoctorDetailsData.fromJson(v));
      });
    }
    statusCode = json['statusCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.doctorData != null) {
      data['doctorData'] = this.doctorData!.map((v) => v.toJson()).toList();
    }
    data['statusCode'] = this.statusCode;
    return data;
  }
}
