class DoctorCategoryDataModel {
  List<DoctorCategoryData>? doctorCategoryData;
  int? statusCode;

  DoctorCategoryDataModel({this.doctorCategoryData, this.statusCode});

  DoctorCategoryDataModel.fromJson(Map<String, dynamic> json) {
    if (json['doctorCategoryData'] != null) {
      doctorCategoryData = <DoctorCategoryData>[];
      json['doctorCategoryData'].forEach((v) {
        doctorCategoryData!.add(new DoctorCategoryData.fromJson(v));
      });
    }
    statusCode = json['statusCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.doctorCategoryData != null) {
      data['doctorCategoryData'] = this.doctorCategoryData!.map((v) => v.toJson()).toList();
    }
    data['statusCode'] = this.statusCode;
    return data;
  }
}

class DoctorCategoryData {
  String? id;
  String? name;
  String? image;

  DoctorCategoryData({this.id, this.name, this.image});

  DoctorCategoryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }

  DoctorCategoryData copyWith({
    String? id,
    String? name,
    String? image,
  }) {
    return DoctorCategoryData(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }
}
