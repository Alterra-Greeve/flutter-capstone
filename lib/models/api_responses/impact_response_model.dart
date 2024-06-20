import 'dart:convert';

class ImpactResponseModel {
  bool status;
  String message;
  List<List<Datum>> data;

  ImpactResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  ImpactResponseModel copyWith({
    bool? status,
    String? message,
    List<List<Datum>>? data,
  }) =>
      ImpactResponseModel(
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory ImpactResponseModel.fromRawJson(String str) =>
      ImpactResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ImpactResponseModel.fromJson(Map<String, dynamic> json) =>
      ImpactResponseModel(
        status: json["status"],
        message: json["message"],
        data: List<List<Datum>>.from(json["data"]
            .map((x) => List<Datum>.from(x.map((x) => Datum.fromJson(x))))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(
            data.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
      };
}

class Datum {
  String id;
  String name;
  int impactPoint;
  String iconUrl;
  String imageUrl;
  String description;

  Datum({
    required this.id,
    required this.name,
    required this.impactPoint,
    required this.iconUrl,
    required this.imageUrl,
    required this.description,
  });

  Datum copyWith({
    String? id,
    String? name,
    int? impactPoint,
    String? iconUrl,
    String? imageUrl,
    String? description,
  }) =>
      Datum(
        id: id ?? this.id,
        name: name ?? this.name,
        impactPoint: impactPoint ?? this.impactPoint,
        iconUrl: iconUrl ?? this.iconUrl,
        imageUrl: imageUrl ?? this.imageUrl,
        description: description ?? this.description,
      );

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        impactPoint: json["impact_point"],
        iconUrl: json["icon_url"],
        imageUrl: json["image_url"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "impact_point": impactPoint,
        "icon_url": iconUrl,
        "image_url": imageUrl,
        "description": description,
      };
}
