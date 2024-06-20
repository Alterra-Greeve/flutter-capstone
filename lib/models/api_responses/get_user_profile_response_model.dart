import 'dart:convert';

GetUserProfileResponseModel getUserProfileResponseModelFromJson(String str) => GetUserProfileResponseModel.fromJson(json.decode(str));

String getUserProfileResponseModelToJson(GetUserProfileResponseModel data) => json.encode(data.toJson());

class GetUserProfileResponseModel {
    final bool? status;
    final String? message;
    final Data? data;

    GetUserProfileResponseModel({
        this.status,
        this.message,
        this.data,
    });

    factory GetUserProfileResponseModel.fromJson(Map<String, dynamic> json) => GetUserProfileResponseModel(
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
    final String? id;
    final String? name;
    final String? username;
    final String? email;
    final String? address;
    final String? gender;
    final String? phone;
    final int? coin;
    final int? exp;
    final int? impactPoint;
    final String? avatarUrl;

    Data({
        this.id,
        this.name,
        this.username,
        this.email,
        this.address,
        this.gender,
        this.phone,
        this.coin,
        this.exp,
        this.impactPoint,
        this.avatarUrl,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        address: json["address"],
        gender: json["gender"],
        phone: json["phone"],
        coin: json["coin"],
        exp: json["exp"],
        impactPoint: json["impact_point"],
        avatarUrl: json["avatar_url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "address": address,
        "gender": gender,
        "phone": phone,
        "coin": coin,
        "exp": exp,
        "impact_point": impactPoint,
        "avatar_url": avatarUrl,
    };
}
