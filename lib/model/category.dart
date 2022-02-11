class CategoryMenuType {
  CategoryMenuType({
      this.id, 
      this.title, 
      this.description, 
      this.image,});

  CategoryMenuType.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
  }
  int? id;
  String? title;
  String? description;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['description'] = description;
    map['image'] = image;
    return map;
  }

}