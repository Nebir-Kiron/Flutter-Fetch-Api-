// To parse this JSON data, do
//
//     final michaelModel = michaelModelFromJson(jsonString);

import 'dart:convert';

MichaelModel michaelModelFromJson(String str) => MichaelModel.fromJson(json.decode(str));

String michaelModelToJson(MichaelModel data) => json.encode(data.toJson());

class MichaelModel {
  MichaelModel({
    this.name,
    this.age,
    this.count,
  });

  String? name;
  int? age;
  int? count;

  factory MichaelModel.fromJson(Map<String, dynamic> json) => MichaelModel(
    name: json["name"],
    age: json["age"],
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "age": age,
    "count": count,
  };
}
