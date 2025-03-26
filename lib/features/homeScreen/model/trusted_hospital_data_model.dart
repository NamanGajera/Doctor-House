import '../../../commonModel/hospital_details_data_model.dart';

class TrustedHospitalDataModel {
  int? statusCode;
  List<HospitalDetailsData>? topHospital;

  TrustedHospitalDataModel({this.statusCode, this.topHospital});

  TrustedHospitalDataModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    if (json['topHospital'] != null) {
      topHospital = <HospitalDetailsData>[];
      json['topHospital'].forEach((v) {
        topHospital!.add(new HospitalDetailsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    if (this.topHospital != null) {
      data['topHospital'] = this.topHospital!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
