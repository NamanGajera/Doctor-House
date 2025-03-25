class TopDoctorsDataModel {
  List<TopDoctor>? topDoctor;
  int? statusCode;

  TopDoctorsDataModel({this.topDoctor, this.statusCode});

  TopDoctorsDataModel.fromJson(Map<String, dynamic> json) {
    if (json['topDoctor'] != null) {
      topDoctor = <TopDoctor>[];
      json['topDoctor'].forEach((v) {
        topDoctor!.add(new TopDoctor.fromJson(v));
      });
    }
    statusCode = json['statusCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.topDoctor != null) {
      data['topDoctor'] = this.topDoctor!.map((v) => v.toJson()).toList();
    }
    data['statusCode'] = this.statusCode;
    return data;
  }
}

class TopDoctor {
  String? id;
  String? name;
  String? doctorType;
  String? experience;
  double? rating;
  String? address;
  bool? isLiked;
  String? categoryId;
  Category? category;

  TopDoctor(
      {this.id, this.name, this.doctorType, this.experience, this.rating, this.address, this.isLiked, this.categoryId, this.category});

  TopDoctor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    doctorType = json['doctorType'];
    experience = json['experience'];
    rating = json['rating'];
    address = json['address'];
    isLiked = json['isLiked'];
    categoryId = json['categoryId'];
    category = json['category'] != null ? new Category.fromJson(json['category']) : null;
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
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    return data;
  }

  TopDoctor copyWith({
    String? id,
    String? name,
    String? doctorType,
    String? experience,
    double? rating,
    String? address,
    bool? isLiked,
    String? categoryId,
    Category? category,
  }) {
    return TopDoctor(
      id: id ?? this.id,
      name: name ?? this.name,
      doctorType: doctorType ?? this.doctorType,
      experience: experience ?? this.experience,
      rating: rating ?? this.rating,
      address: address ?? this.address,
      isLiked: isLiked ?? this.isLiked,
      categoryId: categoryId ?? this.categoryId,
      category: category ?? this.category,
    );
  }
}

class Category {
  String? id;
  String? name;

  Category({this.id, this.name});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
