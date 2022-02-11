
class CategoryMenuType {
  int? id;
  String? title;

  CategoryMenuType({
    this.id,
    this.title,
  });

  CategoryMenuType.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    return map;
  }
}
