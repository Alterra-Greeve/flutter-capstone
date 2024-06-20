// To parse this JSON data, do
//
//     final getUserChallengeResponseModel = getUserChallengeResponseModelFromJson(jsonString);

import 'dart:convert';

GetUserChallengeResponseModel getUserChallengeResponseModelFromJson(String str) => GetUserChallengeResponseModel.fromJson(json.decode(str));

String getUserChallengeResponseModelToJson(GetUserChallengeResponseModel data) => json.encode(data.toJson());

class GetUserChallengeResponseModel {
    final bool? status;
    final String? message;
    final List<Datum>? data;

    GetUserChallengeResponseModel({
        this.status,
        this.message,
        this.data,
    });

    factory GetUserChallengeResponseModel.fromJson(Map<String, dynamic> json) => GetUserChallengeResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    final String? challengeConfirmationId;
    final String? userId;
    final String? status;
    final Challenge? challenge;
    final dynamic images;

    Datum({
        this.challengeConfirmationId,
        this.userId,
        this.status,
        this.challenge,
        this.images,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        challengeConfirmationId: json["challenge_confirmation_id"],
        userId: json["user_id"],
        status: json["status"],
        challenge: json["challenge"] == null ? null : Challenge.fromJson(json["challenge"]),
        images: json["images"],
    );

    Map<String, dynamic> toJson() => {
        "challenge_confirmation_id": challengeConfirmationId,
        "user_id": userId,
        "status": status,
        "challenge": challenge?.toJson(),
        "images": images,
    };
}

class Challenge {
    final String? id;
    final String? title;
    final String? description;
    final int? coin;
    final int? exp;
    final int? participant;
    final String? difficulty;
    final String? imageUrl;
    final String? dateStart;
    final String? dateEnd;
    final List<Category>? categories;

    Challenge({
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
        categories: json["categories"] == null ? [] : List<Category>.from(json["categories"]!.map((x) => Category.fromJson(x))),
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
        "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x.toJson())),
    };
}

class Category {
    final ImpactCategory? impactCategory;

    Category({
        this.impactCategory,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        impactCategory: json["impact_category"] == null ? null : ImpactCategory.fromJson(json["impact_category"]),
    );

    Map<String, dynamic> toJson() => {
        "impact_category": impactCategory?.toJson(),
    };
}

class ImpactCategory {
    final String? id;
    final String? name;
    final int? impactPoint;
    final String? iconUrl;

    ImpactCategory({
        this.id,
        this.name,
        this.impactPoint,
        this.iconUrl,
    });

    factory ImpactCategory.fromJson(Map<String, dynamic> json) => ImpactCategory(
        id: json["id"],
        name: json["name"],
        impactPoint: json["impact_point"],
        iconUrl: json["icon_url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "impact_point": impactPoint,
        "icon_url": iconUrl,
    };
}
