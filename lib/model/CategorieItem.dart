// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

CategoryItem welcomeFromJson(String str) => CategoryItem.fromJson(json.decode(str));

String welcomeToJson(CategoryItem data) => json.encode(data.toJson());

class CategoryItem {
  CategoryItem({
    this.id,
    this.title,
    this.price,
    this.description,
    this.image,
    this.category,
    this.choices,
  });

  int? id;
  String? title;
  String? price;
  String? description;
  String? image;
  Category? category;
  List<dynamic>? choices;

  factory CategoryItem.fromJson(Map<String, dynamic> json) => CategoryItem(
    id: json["id"],
    title: json["title"],
    price: json["price"],
    description: json["description"],
    image: json["image"],
    category: Category.fromJson(json["category"]),
    choices: List<dynamic>.from(json["choices"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "description": description,
    "image": image,
    "category": category?.toJson(),
    //"choices": List<dynamic>.from(choices.map((x) => x)),
  };
}

class Category {
  Category({
    this.id,
    this.title,
    this.description,
    this.image,
  });

  int? id;
  String? title;
  String? description;
  String? image;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "image": image,
  };
}