class CityData {
  int? cityId;
  String? name;

  CityData({this.cityId, this.name});

  CityData.fromJson(Map<String, dynamic> json) {
    cityId = json['cityId'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cityId'] = cityId;
    data['name'] = name;
    return data;
  }
}
