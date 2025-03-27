import '../../../commonModel/category_data_model.dart';

class DoctorCategoryDataModel {
  List<CategoryData>? doctorCategoryData;
  int? statusCode;

  DoctorCategoryDataModel({this.doctorCategoryData, this.statusCode});

  DoctorCategoryDataModel.fromJson(Map<String, dynamic> json) {
    if (json['doctorCategoryData'] != null) {
      doctorCategoryData = <CategoryData>[];
      json['doctorCategoryData'].forEach((v) {
        doctorCategoryData!.add(CategoryData.fromJson(v));
      });
    }
    statusCode = json['statusCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (doctorCategoryData != null) {
      data['doctorCategoryData'] = doctorCategoryData!.map((v) => v.toJson()).toList();
    }
    data['statusCode'] = statusCode;
    return data;
  }
}
