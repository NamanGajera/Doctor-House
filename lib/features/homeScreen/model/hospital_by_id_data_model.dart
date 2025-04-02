import 'package:doctor_house/commonModel/hospital_details_data_model.dart';

class HospitalByIdDataModel {
  HospitalDetailsData? hospitalData;
  int? statusCode;

  HospitalByIdDataModel({this.hospitalData, this.statusCode});

  HospitalByIdDataModel.fromJson(Map<String, dynamic> json) {
    hospitalData = json['hospitalData'] != null ? new HospitalDetailsData.fromJson(json['hospitalData']) : null;
    statusCode = json['statusCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.hospitalData != null) {
      data['hospitalData'] = this.hospitalData!.toJson();
    }
    data['statusCode'] = this.statusCode;
    return data;
  }
}
