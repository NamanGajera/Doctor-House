class CityData {
  int? cityId;
  String? name;

  CityData({this.cityId, this.name});

  CityData.fromJson(Map<String, dynamic> json) {
    cityId = json['cityId'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cityId'] = this.cityId;
    data['name'] = this.name;
    return data;
  }
}
