class GetUpcomingScheduleDataModel {
  int? statusCode;
  int? count;
  List<AppointmentData>? appointmentData;

  GetUpcomingScheduleDataModel({this.statusCode, this.count, this.appointmentData});

  GetUpcomingScheduleDataModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    count = json['count'];
    if (json['appointmentData'] != null) {
      appointmentData = <AppointmentData>[];
      json['appointmentData'].forEach((v) {
        appointmentData!.add(AppointmentData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['count'] = count;
    if (appointmentData != null) {
      data['appointmentData'] = appointmentData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AppointmentData {
  String? id;
  String? appointmentId;
  String? appointmentDate;
  String? appointmentNumber;
  String? doctorName;
  String? doctorType;
  String? doctorImage;
  String? clinicName;
  String? patientName;
  String? appointmentStatus;
  int? fee;
  bool? insuranceCovered;

  AppointmentData(
      {this.id,
      this.appointmentId,
      this.appointmentDate,
      this.appointmentNumber,
      this.doctorName,
      this.doctorType,
      this.doctorImage,
      this.clinicName,
      this.patientName,
      this.appointmentStatus,
      this.fee,
      this.insuranceCovered});

  AppointmentData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    appointmentId = json['appointmentId'];
    appointmentDate = json['appointmentDate'];
    appointmentNumber = json['appointmentNumber'];
    doctorName = json['doctorName'];
    doctorType = json['doctorType'];
    doctorImage = json['doctorImage'];
    clinicName = json['clinicName'];
    patientName = json['patientName'];
    appointmentStatus = json['appointmentStatus'];
    fee = json['fee'];
    insuranceCovered = json['insuranceCovered'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['appointmentId'] = appointmentId;
    data['appointmentDate'] = appointmentDate;
    data['appointmentNumber'] = appointmentNumber;
    data['doctorName'] = doctorName;
    data['doctorType'] = doctorType;
    data['doctorImage'] = doctorImage;
    data['clinicName'] = clinicName;
    data['patientName'] = patientName;
    data['appointmentStatus'] = appointmentStatus;
    data['fee'] = fee;
    data['insuranceCovered'] = insuranceCovered;
    return data;
  }
}
