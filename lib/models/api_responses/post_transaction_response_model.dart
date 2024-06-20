



import 'dart:convert';

PostTransactionResponseModel postTransactionResponseModelFromJson(String str) => PostTransactionResponseModel.fromJson(json.decode(str));

String postTransactionResponseModelToJson(PostTransactionResponseModel data) => json.encode(data.toJson());

class PostTransactionResponseModel {
    bool? status;
    String? message;
    Data? data;

    PostTransactionResponseModel({
        this.status,
        this.message,
        this.data,
    });

    factory PostTransactionResponseModel.fromJson(Map<String, dynamic> json) => PostTransactionResponseModel(
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
    int? amount;
    String? snapUrl;

    Data({
        this.id,
        this.amount,
        this.snapUrl,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        amount: json["amount"],
        snapUrl: json["snap_url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "amount": amount,
        "snap_url": snapUrl,
    };
}
