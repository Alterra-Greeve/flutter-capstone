import 'dart:convert';

ChallengeResponseModel challengeResponseModelFromJson(String str) =>
    ChallengeResponseModel.fromJson(json.decode(str));

String challengeResponseModelToJson(ChallengeResponseModel data) =>
    json.encode(data.toJson());

class ChallengeResponseModel {
  bool? status;
  String? message;
  Data? data;

  ChallengeResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory ChallengeResponseModel.fromJson(Map<String, dynamic> json) =>
      ChallengeResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  String? id;
  String? title;
  String? description;
  int? coin;
  int? exp;
  int? participant;
  String? difficulty;
  String? imageUrl;
  String? dateStart;
  String? dateEnd;
  List<Category>? categories;

  Data({
    this.id,
    this.title,
    this.description,
    this.coin,
    this.exp,
    this.participant,
    this.difficulty,
    this.imageUrl,
    this.dateStart,
    this.dateEnd,
    this.categories,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        coin: json["coin"],
        exp: json["exp"],
        participant: json["participant"],
        difficulty: json["difficulty"],
        imageUrl: json["image_url"],
        dateStart: json["date_start"],
        dateEnd: json["date_end"],
        categories: json["categories"] == null
            ? []
            : List<Category>.from(
                json["categories"]!.map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "coin": coin,
        "exp": exp,
        "participant": participant,
        "difficulty": difficulty,
        "image_url": imageUrl,
        "date_start": dateStart,
        "date_end": dateEnd,
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
  String? iconUrl;

  ImpactCategory({
    this.name,
    this.impactPoint,
    this.iconUrl,
  });

  factory ImpactCategory.fromJson(Map<String, dynamic> json) => ImpactCategory(
        name: json["name"],
        impactPoint: json["impact_point"],
        iconUrl: json["icon_url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "impact_point": impactPoint,
        "icon_url": iconUrl,
      };
}
