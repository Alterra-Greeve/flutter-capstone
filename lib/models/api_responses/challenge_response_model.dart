import 'dart:convert';

ChallengeResponseModel challengeResponseModelFromJson(String str) =>
    ChallengeResponseModel.fromJson(json.decode(str));

String challengeResponseModelToJson(ChallengeResponseModel data) =>
    json.encode(data.toJson());

class ChallengeResponseModel {
  bool status;
  String message;
  Data data;

  ChallengeResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ChallengeResponseModel.fromJson(Map<String, dynamic> json) =>
      ChallengeResponseModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  String challengeConfirmationId;
  String userId;
  String status;
  Challenge challenge;
  dynamic images;

  Data({
    required this.challengeConfirmationId,
    required this.userId,
    required this.status,
    required this.challenge,
    required this.images,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        challengeConfirmationId: json["challenge_confirmation_id"],
        userId: json["user_id"],
        status: json["status"],
        challenge: Challenge.fromJson(json["challenge"]),
        images: json["images"],
      );

  Map<String, dynamic> toJson() => {
        "challenge_confirmation_id": challengeConfirmationId,
        "user_id": userId,
        "status": status,
        "challenge": challenge.toJson(),
        "images": images,
      };
}

class Challenge {
  String id;
  String title;
  String description;
  int coin;
  int exp;
  int participant;
  String difficulty;
  String imageUrl;
  String dateStart;
  String dateEnd;
  List<Category> categories;

  Challenge({
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

  factory Challenge.fromJson(Map<String, dynamic> json) => Challenge(
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
        "date_start": dateStart,
        "date_end": dateEnd,
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
  String name;
  int impactPoint;
  String iconUrl;

  ImpactCategory({
    required this.name,
    required this.impactPoint,
    required this.iconUrl,
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
