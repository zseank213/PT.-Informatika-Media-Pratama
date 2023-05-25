// To parse this JSON data, do
//
//     final addFaqModel = addFaqModelFromJson(jsonString);

import 'dart:convert';
import 'package:ptinformatikamediapratama/lib.dart';

AddFaqModel addFaqModelFromJson(String str) => AddFaqModel.fromJson(json.decode(str));

String addFaqModelToJson(AddFaqModel data) => json.encode(data.toJson());

class AddFaqModel {
  int? code;
  String? message;
  EditData? data;

  AddFaqModel({
    this.code,
    this.message,
    this.data,
  });

  factory AddFaqModel.fromJson(Map<String, dynamic> json) => AddFaqModel(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null ? null : EditData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data?.toJson(),
      };
}
