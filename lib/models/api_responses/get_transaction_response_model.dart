import 'dart:convert';

GetTransactionResponseModel getTransactionResponseModelFromJson(String str) => GetTransactionResponseModel.fromJson(json.decode(str));

String getTransactionResponseModelToJson(GetTransactionResponseModel data) => json.encode(data.toJson());

class GetTransactionResponseModel {
    final bool status;
    final String message;
    final List<Datum> data;

    GetTransactionResponseModel({
        required this.status,
        required this.message,
        required this.data,
    });

    factory GetTransactionResponseModel.fromJson(Map<String, dynamic> json) => GetTransactionResponseModel(
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
    final String id;
    final int total;
    final String status;
    final String snapUrl;
    final String productName;
    final String productImage;

    Datum({
        required this.id,
        required this.total,
        required this.status,
        required this.snapUrl,
        required this.productName,
        required this.productImage,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        total: json["total"],
        status: json["status"],
        snapUrl: json["snap_url"],
        productName: json["product_name"],
        productImage: json["product_image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "total": total,
        "status": status,
        "snap_url": snapUrl,
        "product_name": productName,
        "product_image": productImage,
    };
}
