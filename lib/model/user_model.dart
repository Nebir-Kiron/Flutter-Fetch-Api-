
import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.name,
    this.age,
    this.count,
  });

  String? name;
  int? age;
  int? count;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
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
