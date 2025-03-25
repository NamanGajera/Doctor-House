class TrustedHospitalDataModel {
  int? statusCode;
  List<TopHospital>? topHospital;

  TrustedHospitalDataModel({this.statusCode, this.topHospital});

  TrustedHospitalDataModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    if (json['topHospital'] != null) {
      topHospital = <TopHospital>[];
      json['topHospital'].forEach((v) {
        topHospital!.add(new TopHospital.fromJson(v));
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

class TopHospital {
  String? id;
  String? name;
  String? hospitalType;
  String? experience;
  double? rating;
  String? address;
  String? contactNumber;
  bool? isLiked;

  TopHospital({this.id, this.name, this.hospitalType, this.experience, this.rating, this.address, this.contactNumber, this.isLiked});

  TopHospital.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    hospitalType = json['hospitalType'];
    experience = json['experience'];
    rating = json['rating'];
    address = json['address'];
    contactNumber = json['contactNumber'];
    isLiked = json['isLiked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['hospitalType'] = this.hospitalType;
    data['experience'] = this.experience;
    data['rating'] = this.rating;
    data['address'] = this.address;
    data['contactNumber'] = this.contactNumber;
    data['isLiked'] = this.isLiked;
    return data;
  }

  TopHospital copyWith({
    String? id,
    String? name,
    String? hospitalType,
    String? experience,
    double? rating,
    String? address,
    String? contactNumber,
    bool? isLiked,
  }) {
    return TopHospital(
      id: id ?? this.id,
      name: name ?? this.name,
      hospitalType: hospitalType ?? this.hospitalType,
      experience: experience ?? this.experience,
      rating: rating ?? this.rating,
      address: address ?? this.address,
      contactNumber: contactNumber ?? this.contactNumber,
      isLiked: isLiked ?? this.isLiked,
    );
  }
}
