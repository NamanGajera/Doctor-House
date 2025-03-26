class StateData {
  int? stateId;
  String? name;

  StateData({this.stateId, this.name});

  StateData.fromJson(Map<String, dynamic> json) {
    stateId = json['stateId'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stateId'] = this.stateId;
    data['name'] = this.name;
    return data;
  }
}
