class SuccessResponseModel {
  int? statusCode;
  String? message;

  SuccessResponseModel({this.statusCode, this.message});

  SuccessResponseModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['message'] = message;
    return data;
  }
}
