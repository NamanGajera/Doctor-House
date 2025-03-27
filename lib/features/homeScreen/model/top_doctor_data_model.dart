import '../../../commonModel/doctor_details_data_model.dart';

class TopDoctorsDataModel {
  List<DoctorDetailsData>? topDoctor;
  int? statusCode;

  TopDoctorsDataModel({this.topDoctor, this.statusCode});

  TopDoctorsDataModel.fromJson(Map<String, dynamic> json) {
    if (json['topDoctor'] != null) {
      topDoctor = <DoctorDetailsData>[];
      json['topDoctor'].forEach((v) {
        topDoctor!.add(DoctorDetailsData.fromJson(v));
      });
    }
    statusCode = json['statusCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (topDoctor != null) {
      data['topDoctor'] = topDoctor!.map((v) => v.toJson()).toList();
    }
    data['statusCode'] = statusCode;
    return data;
  }
}
