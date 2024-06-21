import 'dart:convert';

VoucherResponseModel voucherResponseModelFromJson(String str) =>
    VoucherResponseModel.fromJson(json.decode(str));

String voucherResponseModelToJson(VoucherResponseModel data) =>
    json.encode(data.toJson());

class VoucherResponseModel {
  bool status;
  String message;
  List<Datum> data;

  VoucherResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory VoucherResponseModel.fromJson(Map<String, dynamic> json) =>
      VoucherResponseModel(
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
  String name;
  String code;
  String discount;
  String description;
  String expiredAt;
  int used;

  Datum({
    required this.id,
    required this.name,
    required this.code,
    required this.discount,
    required this.description,
    required this.expiredAt,
    required this.used,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        code: json["code"],
        discount: json["discount"],
        description: json["description"],
        expiredAt: json["expired_at"],
        used: json["used"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
        "discount": discount,
        "description": description,
        "expired_at": expiredAt,
        "used": used,
      };
}

CoinResponseModel coinResponseModelFromJson(String str) =>
    CoinResponseModel.fromJson(json.decode(str));

String coinResponseModelToJson(CoinResponseModel data) =>
    json.encode(data.toJson());

class CoinResponseModel {
  bool status;
  String message;
  List<CoinDatum> data;

  CoinResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CoinResponseModel.fromJson(Map<String, dynamic> json) =>
      CoinResponseModel(
        status: json["status"],
        message: json["message"],
        data: List<CoinDatum>.from(
            json["data"].map((x) => CoinDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CoinDatum {
  String id;
  String name;
  String? type;
  int coin;
  DateTime date;

  CoinDatum({
    required this.id,
    required this.name,
    this.type,
    required this.coin,
    required this.date,
  });

  factory CoinDatum.fromJson(Map<String, dynamic> json) => CoinDatum(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        coin: json["coin"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "coin": coin,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
      };
}
