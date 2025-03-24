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
        appointmentData!.add(new AppointmentData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['count'] = this.count;
    if (this.appointmentData != null) {
      data['appointmentData'] = this.appointmentData!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['appointmentId'] = this.appointmentId;
    data['appointmentDate'] = this.appointmentDate;
    data['appointmentNumber'] = this.appointmentNumber;
    data['doctorName'] = this.doctorName;
    data['doctorType'] = this.doctorType;
    data['doctorImage'] = this.doctorImage;
    data['clinicName'] = this.clinicName;
    data['patientName'] = this.patientName;
    data['appointmentStatus'] = this.appointmentStatus;
    data['fee'] = this.fee;
    data['insuranceCovered'] = this.insuranceCovered;
    return data;
  }
}
