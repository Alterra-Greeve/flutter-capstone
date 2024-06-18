// To parse this JSON data, do
//
//     final getTransactionResponseModel = getTransactionResponseModelFromJson(jsonString);

import 'dart:convert';

GetTransactionResponseModel getTransactionResponseModelFromJson(String str) =>
    GetTransactionResponseModel.fromJson(json.decode(str));

String getTransactionResponseModelToJson(GetTransactionResponseModel data) =>
    json.encode(data.toJson());

class GetTransactionResponseModel {
  bool? status;
  String? message;
  List<Datum>? data;

  GetTransactionResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory GetTransactionResponseModel.fromJson(Map<String, dynamic> json) =>
      GetTransactionResponseModel(
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
  int? total;
  String? status;
  String? snapUrl;
  String? productName;
  String? productImage;

  Datum({
    this.id,
    this.total,
    this.status,
    this.snapUrl,
    this.productName,
    this.productImage,
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

  String getDisplayStatus() {
    switch (status) {
      case 'Pending':
        return 'Belum dibayar';
      case 'Berhasil':
        return 'Selesai';
      case 'Gagal':
        return 'Dibatalkan';
      default:
        return status ?? '';
    }
  }
}
