import 'dart:convert';

GenericResponse genericResponseFromJson(String str) =>
    GenericResponse.fromJson(json.decode(str));

String genericResponseToJson(GenericResponse data) =>
    json.encode(data.toJson());

class GenericResponse {
  bool? status;
  String? message;
  dynamic data;

  GenericResponse({
    this.status,
    this.message,
    this.data,
  });

  factory GenericResponse.fromJson(Map<String, dynamic> json) =>
      GenericResponse(
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
