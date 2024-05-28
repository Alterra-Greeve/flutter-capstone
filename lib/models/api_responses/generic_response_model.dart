import 'dart:convert';

GenericResponseModel genericResponseFromJson(String str) =>
    GenericResponseModel.fromJson(json.decode(str));

String genericResponseToJson(GenericResponseModel data) =>
    json.encode(data.toJson());

class GenericResponseModel {
  bool? status;
  String? message;
  dynamic data;

  GenericResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory GenericResponseModel.fromJson(Map<String, dynamic> json) =>
      GenericResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data,
      };
}
