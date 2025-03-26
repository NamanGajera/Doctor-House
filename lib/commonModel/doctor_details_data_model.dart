import 'package:doctor_house/commonModel/city_data_model.dart';
import 'package:doctor_house/commonModel/state_data_model.dart';

import 'category_data_model.dart';

class DoctorDetailsData {
  String? id;
  String? name;
  String? doctorType;
  String? experience;
  double? rating;
  String? address;
  bool? isLiked;
  String? categoryId;
  CategoryData? category;
  CityData? city;
  StateData? state;

  DoctorDetailsData({
    this.id,
    this.name,
    this.doctorType,
    this.experience,
    this.rating,
    this.address,
    this.isLiked,
    this.categoryId,
    this.category,
    this.city,
    this.state,
  });

  DoctorDetailsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    doctorType = json['doctorType'];
    experience = json['experience'];
    rating = json['rating'];
    address = json['address'];
    isLiked = json['isLiked'];
    categoryId = json['categoryId'];
    city = json['city'] != null ? new CityData.fromJson(json['city']) : null;
    state = json['state'] != null ? new StateData.fromJson(json['state']) : null;
    category = json['category'] != null ? new CategoryData.fromJson(json['category']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['doctorType'] = this.doctorType;
    data['experience'] = this.experience;
    data['rating'] = this.rating;
    data['address'] = this.address;
    data['isLiked'] = this.isLiked;
    data['categoryId'] = this.categoryId;
    if (this.city != null) {
      data['city'] = this.city!.toJson();
    }
    if (this.state != null) {
      data['state'] = this.state!.toJson();
    }
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    return data;
  }

  DoctorDetailsData copyWith({
    String? id,
    String? name,
    String? doctorType,
    String? experience,
    double? rating,
    String? address,
    bool? isLiked,
    String? categoryId,
    CategoryData? category,
    CityData? city,
    StateData? state,
  }) {
    return DoctorDetailsData(
      id: id ?? this.id,
      name: name ?? this.name,
      doctorType: doctorType ?? this.doctorType,
      experience: experience ?? this.experience,
      rating: rating ?? this.rating,
      address: address ?? this.address,
      isLiked: isLiked ?? this.isLiked,
      categoryId: categoryId ?? this.categoryId,
      category: category ?? this.category,
      city: city ?? this.city,
      state: state ?? this.state,
    );
  }
}
