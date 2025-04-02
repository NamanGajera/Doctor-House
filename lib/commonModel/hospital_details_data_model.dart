import 'package:doctor_house/commonModel/city_data_model.dart';
import 'package:doctor_house/commonModel/doctor_details_data_model.dart';
import 'package:doctor_house/commonModel/state_data_model.dart';

class HospitalDetailsData {
  String? id;
  String? name;
  String? hospitalType;
  String? experience;
  double? rating;
  String? address;
  String? contactNumber;
  bool? isLiked;
  CityData? city;
  StateData? state;
  double? latitude;
  double? longitude;
  dynamic distance;
  dynamic openHours;
  dynamic website;
  dynamic treatment;
  List<DoctorDetailsData>? doctors;
  dynamic gallery;

  HospitalDetailsData({
    this.id,
    this.name,
    this.hospitalType,
    this.experience,
    this.rating,
    this.address,
    this.contactNumber,
    this.isLiked,
    this.state,
    this.city,
    this.distance,
    this.doctors,
    this.gallery,
    this.latitude,
    this.longitude,
    this.openHours,
    this.treatment,
    this.website,
  });

  HospitalDetailsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    hospitalType = json['hospitalType'];
    experience = json['experience'];
    rating = json['rating'];
    address = json['address'];
    contactNumber = json['contactNumber'];
    isLiked = json['isLiked'];
    city = json['city'] != null ? CityData.fromJson(json['city']) : null;
    state = json['state'] != null ? StateData.fromJson(json['state']) : null;
    latitude = json['latitude'];
    longitude = json['longitude'];
    distance = json['distance'];
    openHours = json['openHours'];
    website = json['website'];
    treatment = json['treatment'];
    if (json['doctors'] != null) {
      doctors = <DoctorDetailsData>[];
      json['doctors'].forEach((v) {
        doctors!.add(new DoctorDetailsData.fromJson(v));
      });
    }
    gallery = json['gallery'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['hospitalType'] = hospitalType;
    data['experience'] = experience;
    data['rating'] = rating;
    data['address'] = address;
    data['contactNumber'] = contactNumber;
    data['isLiked'] = isLiked;
    if (this.city != null) {
      data['city'] = this.city!.toJson();
    }
    if (this.state != null) {
      data['state'] = this.state!.toJson();
    }
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['distance'] = this.distance;
    data['openHours'] = this.openHours;
    data['website'] = this.website;
    data['treatment'] = this.treatment;
    if (this.doctors != null) {
      data['doctors'] = this.doctors!.map((v) => v.toJson()).toList();
    }
    data['gallery'] = this.gallery;
    return data;
  }

  HospitalDetailsData copyWith({
    String? id,
    String? name,
    String? hospitalType,
    String? experience,
    double? rating,
    String? address,
    String? contactNumber,
    bool? isLiked,
    CityData? city,
    StateData? state,
    double? latitude,
    double? longitude,
    dynamic distance,
    dynamic openHours,
    dynamic website,
    dynamic treatment,
    List<DoctorDetailsData>? doctors,
    dynamic gallery,
  }) {
    return HospitalDetailsData(
      id: id ?? this.id,
      name: name ?? this.name,
      hospitalType: hospitalType ?? this.hospitalType,
      experience: experience ?? this.experience,
      rating: rating ?? this.rating,
      address: address ?? this.address,
      contactNumber: contactNumber ?? this.contactNumber,
      isLiked: isLiked ?? this.isLiked,
      city: city ?? this.city,
      state: state ?? this.state,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      distance: distance ?? this.distance,
      openHours: openHours ?? this.openHours,
      website: website ?? this.website,
      treatment: treatment ?? this.treatment,
      doctors: doctors ?? this.doctors,
      gallery: gallery ?? this.gallery,
    );
  }
}
