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
    final String? id;
    final String? title;
    final String? description;
    final int? point;
    final int? exp;
    final String? status;
    final List<Image>? image;

    Datum({
        this.id,
        this.title,
        this.description,
        this.point,
        this.exp,
        this.status,
        this.image,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        point: json["point"],
        exp: json["exp"],
        status: json["status"],
        image: json["image"] == null ? [] : List<Image>.from(json["image"]!.map((x) => Image.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "point": point,
        "exp": exp,
        "status": status,
        "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x.toJson())),
    };
}

class Image {
    final String? id;
    final String? url;

    Image({
        this.id,
        this.url,
    });

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
    };
}
