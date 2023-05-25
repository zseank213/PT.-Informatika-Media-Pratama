// To parse this JSON data, do
//
//     final deleteFaqModel = deleteFaqModelFromJson(jsonString);

import 'dart:convert';

DeleteFaqModel deleteFaqModelFromJson(String str) => DeleteFaqModel.fromJson(json.decode(str));

String deleteFaqModelToJson(DeleteFaqModel data) => json.encode(data.toJson());

class DeleteFaqModel {
  int? code;
  String? message;
  dynamic data;

  DeleteFaqModel({
    this.code,
    this.message,
    this.data,
  });

  factory DeleteFaqModel.fromJson(Map<String, dynamic> json) => DeleteFaqModel(
        code: json["code"],
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data,
      };
}
