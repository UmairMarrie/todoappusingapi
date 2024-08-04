
class TodoModel {
  String? title;
  String? descp;
  String? id;

  TodoModel({this.title, this.descp, this.id});

  TodoModel.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    descp = json["descp"];
    id = json["id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["title"] = title;
    _data["descp"] = descp;
    _data["id"] = id;
    return _data;
  }
}