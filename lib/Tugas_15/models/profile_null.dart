// To parse this JSON data, do
//
//     final profilenull = profilenullFromJson(jsonString);

import 'dart:convert';

Profilenull profilenullFromJson(String str) =>
    Profilenull.fromJson(json.decode(str));

String profilenullToJson(Profilenull data) => json.encode(data.toJson());

class Profilenull {
  String? message;

  Profilenull({this.message});

  factory Profilenull.fromJson(Map<String, dynamic> json) =>
      Profilenull(message: json["message"]);

  Map<String, dynamic> toJson() => {"message": message};
}
