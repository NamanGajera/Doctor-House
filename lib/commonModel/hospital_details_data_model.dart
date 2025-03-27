class HospitalDetailsData {
  String? id;
  String? name;
  String? hospitalType;
  String? experience;
  double? rating;
  String? address;
  String? contactNumber;
  bool? isLiked;

  HospitalDetailsData(
      {this.id, this.name, this.hospitalType, this.experience, this.rating, this.address, this.contactNumber, this.isLiked});

  HospitalDetailsData.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['hospitalType'] = hospitalType;
    data['experience'] = experience;
    data['rating'] = rating;
    data['address'] = address;
    data['contactNumber'] = contactNumber;
    data['isLiked'] = isLiked;
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
    );
  }
}
