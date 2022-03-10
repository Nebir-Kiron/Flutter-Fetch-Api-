// To parse this JSON data, do
//
//  final catModel = catModelFromJson(jsonString);

import 'dart:convert';

CatModel catModelFromJson(String str) => CatModel.fromJson(json.decode(str));

String catModelToJson(CatModel data) => json.encode(data.toJson());

class CatModel {
  CatModel({
    this.status,
    this.cats,
    this.message,
  });

  int ?status;
  List<Cat> ?cats;
  List<dynamic> ?message;

  factory CatModel.fromJson(Map<String, dynamic> json) => CatModel(
    status: json["status"],
    cats: List<Cat>.from(json["cats"].map((x) => Cat.fromJson(x))),
    message: List<dynamic>.from(json["message"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "cats": List<dynamic>.from(cats!.map((x) => x.toJson())),
    "message": List<dynamic>.from(message!.map((x) => x)),
  };
}

class Cat {
  Cat({
    this.catId,
    this.catName,
    this.catSlug,
    this.catPlural,
    this.catIcon,
    this.catOrder,
    this.catImg,
  });

  String ?catId;
  String ?catName;
  String ?catSlug;
  String ?catPlural;
  String ?catIcon;
  String ?catOrder;
  String ?catImg;

  factory Cat.fromJson(Map<String, dynamic> json) => Cat(
    catId: json["cat_id"],
    catName: json["cat_name"],
    catSlug: json["cat_slug"],
    catPlural: json["cat_plural"],
    catIcon: json["cat_icon"],
    catOrder: json["cat_order"],
    catImg: json["cat_img"],
  );

  Map<String, dynamic> toJson() => {
    "cat_id": catId,
    "cat_name": catName,
    "cat_slug": catSlug,
    "cat_plural": catPlural,
    "cat_icon": catIcon,
    "cat_order": catOrder,
    "cat_img": catImg,
  };
}
