import 'dart:convert';

ChallengesResponseModel challengesResponseModelFromJson(String str) =>
    ChallengesResponseModel.fromJson(json.decode(str));

String challengesResponseModelToJson(ChallengesResponseModel data) =>
    json.encode(data.toJson());

class ChallengesResponseModel {
  bool? status;
  String? message;
  List<Datum>? data;

  ChallengesResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory ChallengesResponseModel.fromJson(Map<String, dynamic> json) =>
      ChallengesResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  String? id;
  String? title;
  String? description;
  String? imageUrl;
  DateTime? dateStart;
  DateTime? dateEnd;
  List<Category>? categories;

  Datum({
    this.id,
    this.title,
    this.description,
    this.imageUrl,
    this.dateStart,
    this.dateEnd,
    this.categories,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        imageUrl: json["image_url"],
        dateStart: json["date_start"] == null
            ? null
            : DateTime.parse(json["date_start"]),
        dateEnd:
            json["date_end"] == null ? null : DateTime.parse(json["date_end"]),
        categories: json["categories"] == null
            ? []
            : List<Category>.from(
                json["categories"]!.map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "image_url": imageUrl,
        "date_start":
            "${dateStart!.year.toString().padLeft(4, '0')}-${dateStart!.month.toString().padLeft(2, '0')}-${dateStart!.day.toString().padLeft(2, '0')}",
        "date_end":
            "${dateEnd!.year.toString().padLeft(4, '0')}-${dateEnd!.month.toString().padLeft(2, '0')}-${dateEnd!.day.toString().padLeft(2, '0')}",
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x.toJson())),
      };
}

class Category {
  ImpactCategory? impactCategory;

  Category({
    this.impactCategory,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        impactCategory: json["impact_category"] == null
            ? null
            : ImpactCategory.fromJson(json["impact_category"]),
      );

  Map<String, dynamic> toJson() => {
        "impact_category": impactCategory?.toJson(),
      };
}

class ImpactCategory {
  String? name;
  int? impactPoint;

  ImpactCategory({
    this.name,
    this.impactPoint,
  });

  factory ImpactCategory.fromJson(Map<String, dynamic> json) => ImpactCategory(
        name: json["name"],
        impactPoint: json["impact_point"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "impact_point": impactPoint,
      };
}
