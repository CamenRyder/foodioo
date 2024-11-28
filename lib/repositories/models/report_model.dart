class ReportModel {
  int? id;
  String? name;
  bool? isDeleted;

  ReportModel({this.id, this.name, this.isDeleted});

  ReportModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    isDeleted = json['is_deleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['is_deleted'] = isDeleted;
    return data;
  }
}
