// ignore_for_file: constant_identifier_names

import 'dart:convert';

ChallengesResponseModel challengesResponseModelFromJson(String str) =>
    ChallengesResponseModel.fromJson(json.decode(str));

String challengesResponseModelToJson(ChallengesResponseModel data) =>
    json.encode(data.toJson());

class ChallengesResponseModel {
  bool status;
  String message;
  List<Datum> data;

  ChallengesResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ChallengesResponseModel.fromJson(Map<String, dynamic> json) =>
      ChallengesResponseModel(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  String id;
  String title;
  String description;
  int coin;
  int exp;
  int participant;
  String difficulty;
  String imageUrl;
  DateTime dateStart;
  DateTime dateEnd;
  List<Category> categories;

  Datum({
    required this.id,
    required this.title,
    required this.description,
    required this.coin,
    required this.exp,
    required this.participant,
    required this.difficulty,
    required this.imageUrl,
    required this.dateStart,
    required this.dateEnd,
    required this.categories,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        coin: json["coin"],
        exp: json["exp"],
        participant: json["participant"],
        difficulty: json["difficulty"],
        imageUrl: json["image_url"],
        dateStart: DateTime.parse(json["date_start"]),
        dateEnd: DateTime.parse(json["date_end"]),
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
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
        "date_start":
            "${dateStart.year.toString().padLeft(4, '0')}-${dateStart.month.toString().padLeft(2, '0')}-${dateStart.day.toString().padLeft(2, '0')}",
        "date_end":
            "${dateEnd.year.toString().padLeft(4, '0')}-${dateEnd.month.toString().padLeft(2, '0')}-${dateEnd.day.toString().padLeft(2, '0')}",
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
      };
}

class Category {
  ImpactCategory impactCategory;

  Category({
    required this.impactCategory,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        impactCategory: ImpactCategory.fromJson(json["impact_category"]),
      );

  Map<String, dynamic> toJson() => {
        "impact_category": impactCategory.toJson(),
      };
}

class ImpactCategory {
  String id;
  Name name;
  int impactPoint;
  String iconUrl;

  ImpactCategory({
    required this.id,
    required this.name,
    required this.impactPoint,
    required this.iconUrl,
  });

  factory ImpactCategory.fromJson(Map<String, dynamic> json) => ImpactCategory(
        id: json["id"],
        name: nameValues.map[json["name"]]!,
        impactPoint: json["impact_point"],
        iconUrl: json["icon_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse[name],
        "impact_point": impactPoint,
        "icon_url": iconUrl,
      };
}

enum Name {
  HEMAT_UANG,
  MENGURANGI_PEMANASAN_GLOBAL,
  PERLUAS_WAWASAN,
  UMBUL_PONGGOK_BARU,
  MENGURANGI_LIMBAH
}

final nameValues = EnumValues({
  "Hemat Uang": Name.HEMAT_UANG,
  "Mengurangi Pemanasan Global": Name.MENGURANGI_PEMANASAN_GLOBAL,
  "Perluas Wawasan": Name.PERLUAS_WAWASAN,
  "Umbul Ponggok Baru": Name.UMBUL_PONGGOK_BARU,
  "Mengurangi Limbah": Name.MENGURANGI_LIMBAH
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
