import '../../../commonModel/doctor_details_data_model.dart';

class TopDoctorsDataModel {
  List<DoctorDetailsData>? topDoctor;
  int? statusCode;

  TopDoctorsDataModel({this.topDoctor, this.statusCode});

  TopDoctorsDataModel.fromJson(Map<String, dynamic> json) {
    if (json['topDoctor'] != null) {
      topDoctor = <DoctorDetailsData>[];
      json['topDoctor'].forEach((v) {
        topDoctor!.add(new DoctorDetailsData.fromJson(v));
      });
    }
    statusCode = json['statusCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.topDoctor != null) {
      data['topDoctor'] = this.topDoctor!.map((v) => v.toJson()).toList();
    }
    data['statusCode'] = this.statusCode;
    return data;
  }
}
