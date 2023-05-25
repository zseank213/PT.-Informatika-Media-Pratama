// To parse this JSON data, do
//
//     final detailFaqModel = detailFaqModelFromJson(jsonString);

import 'dart:convert';
import 'package:ptinformatikamediapratama/lib.dart';

DetailFaqModel detailFaqModelFromJson(String str) => DetailFaqModel.fromJson(json.decode(str));

String detailFaqModelToJson(DetailFaqModel data) => json.encode(data.toJson());

class DetailFaqModel {
  int? code;
  String? message;
  ListFAQDatum? data;

  DetailFaqModel({
    this.code,
    this.message,
    this.data,
  });
 
  factory DetailFaqModel.fromJson(Map<String, dynamic> json) => DetailFaqModel(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null ? null : ListFAQDatum.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data?.toJson(),
      };
}
