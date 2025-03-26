class CategoryData {
  String? id;
  String? name;
  String? image;

  CategoryData({this.id, this.name, this.image});

  CategoryData.fromJson(Map<String, dynamic> json) {
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

  CategoryData copyWith({
    String? id,
    String? name,
    String? image,
  }) {
    return CategoryData(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }
}
