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
  double? latitude;
  double? longitude;
  String? about;
  List<String>? specializations;
  List<Qualifications>? qualifications;
  List<WorkingHours>? workingHours;
  List<TimeSlots>? timeSlots;
  String? hospitalId;

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
    this.latitude,
    this.about,
    this.hospitalId,
    this.longitude,
    this.qualifications,
    this.specializations,
    this.timeSlots,
    this.workingHours,
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
    city = json['city'] != null ? CityData.fromJson(json['city']) : null;
    state = json['state'] != null ? StateData.fromJson(json['state']) : null;
    category = json['category'] != null ? CategoryData.fromJson(json['category']) : null;
    latitude = json['latitude'];
    longitude = json['longitude'];
    about = json['about'];
    specializations = (json['specializations'] as List?)?.cast<String>() ?? [];
    if (json['qualifications'] != null) {
      qualifications = <Qualifications>[];
      json['qualifications'].forEach((v) {
        qualifications!.add(Qualifications.fromJson(v));
      });
    }
    if (json['workingHours'] != null) {
      workingHours = <WorkingHours>[];
      json['workingHours'].forEach((v) {
        workingHours!.add(WorkingHours.fromJson(v));
      });
    }
    if (json['timeSlots'] != null) {
      timeSlots = <TimeSlots>[];
      json['timeSlots'].forEach((v) {
        timeSlots!.add(TimeSlots.fromJson(v));
      });
    }
    hospitalId = json['hospitalId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['doctorType'] = doctorType;
    data['experience'] = experience;
    data['rating'] = rating;
    data['address'] = address;
    data['isLiked'] = isLiked;
    data['categoryId'] = categoryId;
    if (city != null) {
      data['city'] = city!.toJson();
    }
    if (state != null) {
      data['state'] = state!.toJson();
    }
    if (category != null) {
      data['category'] = category!.toJson();
    }
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['about'] = about;
    data['specializations'] = specializations;
    if (qualifications != null) {
      data['qualifications'] = qualifications!.map((v) => v.toJson()).toList();
    }
    if (workingHours != null) {
      data['workingHours'] = workingHours!.map((v) => v.toJson()).toList();
    }
    if (timeSlots != null) {
      data['timeSlots'] = timeSlots!.map((v) => v.toJson()).toList();
    }
    data['hospitalId'] = hospitalId;
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
    double? latitude,
    double? longitude,
    String? about,
    List<String>? specializations,
    List<Qualifications>? qualifications,
    List<WorkingHours>? workingHours,
    List<TimeSlots>? timeSlots,
    String? hospitalId,
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
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      about: about ?? this.about,
      specializations: specializations ?? this.specializations,
      qualifications: qualifications ?? this.qualifications,
      workingHours: workingHours ?? this.workingHours,
      timeSlots: timeSlots ?? this.timeSlots,
      hospitalId: hospitalId ?? this.hospitalId,
    );
  }
}

class Qualifications {
  String? id;
  String? degree;
  String? institution;
  int? year;

  Qualifications({this.id, this.degree, this.institution, this.year});

  Qualifications.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    degree = json['degree'];
    institution = json['institution'];
    year = json['year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['degree'] = degree;
    data['institution'] = institution;
    data['year'] = year;
    return data;
  }

  Qualifications copyWith({
    String? id,
    String? degree,
    String? institution,
    int? year,
  }) {
    return Qualifications(
      id: id ?? this.id,
      degree: degree ?? this.degree,
      institution: institution ?? this.institution,
      year: year ?? this.year,
    );
  }
}

class WorkingHours {
  String? id;
  String? day;
  String? startTime;
  String? endTime;
  bool? isAvailable;

  WorkingHours({this.id, this.day, this.startTime, this.endTime, this.isAvailable});

  WorkingHours.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    day = json['day'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    isAvailable = json['isAvailable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['day'] = day;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    data['isAvailable'] = isAvailable;
    return data;
  }

  WorkingHours copyWith({
    String? id,
    String? day,
    String? startTime,
    String? endTime,
    bool? isAvailable,
  }) {
    return WorkingHours(
      id: id ?? this.id,
      day: day ?? this.day,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      isAvailable: isAvailable ?? this.isAvailable,
    );
  }
}

class TimeSlots {
  String? id;
  String? date;
  List<AvailableSlots>? availableSlots;

  TimeSlots({this.id, this.date, this.availableSlots});

  TimeSlots.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    if (json['availableSlots'] != null) {
      availableSlots = <AvailableSlots>[];
      json['availableSlots'].forEach((v) {
        availableSlots!.add(AvailableSlots.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['date'] = date;
    if (availableSlots != null) {
      data['availableSlots'] = availableSlots!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  TimeSlots copyWith({
    String? id,
    String? date,
    List<AvailableSlots>? availableSlots,
  }) {
    return TimeSlots(
      id: id ?? this.id,
      date: date ?? this.date,
      availableSlots: availableSlots ?? this.availableSlots,
    );
  }
}

class AvailableSlots {
  String? id;
  String? startTime;
  String? endTime;
  bool? isBooked;

  AvailableSlots({this.id, this.startTime, this.endTime, this.isBooked});

  AvailableSlots.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    isBooked = json['isBooked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    data['isBooked'] = isBooked;
    return data;
  }

  AvailableSlots copyWith({
    String? id,
    String? startTime,
    String? endTime,
    bool? isBooked,
  }) {
    return AvailableSlots(
      id: id ?? this.id,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      isBooked: isBooked ?? this.isBooked,
    );
  }
}
