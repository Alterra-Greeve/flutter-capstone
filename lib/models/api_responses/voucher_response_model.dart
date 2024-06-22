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

CoinResponseSpendingModel coinResponseSpendingModelFromJson(String str) =>
    CoinResponseSpendingModel.fromJson(json.decode(str));

String coinResponseSpendingModelToJson(CoinResponseSpendingModel data) =>
    json.encode(data.toJson());

class CoinResponseSpendingModel {
  bool status;
  String message;
  List<CoinSpendingDatum> data;

  CoinResponseSpendingModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CoinResponseSpendingModel.fromJson(Map<String, dynamic> json) =>
      CoinResponseSpendingModel(
        status: json["status"],
        message: json["message"],
        data: List<CoinSpendingDatum>.from(
            json["data"].map((x) => CoinSpendingDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CoinSpendingDatum {
  String id;
  String name;
  int coin;
  DateTime date;

  CoinSpendingDatum({
    required this.id,
    required this.name,
    required this.coin,
    required this.date,
  });

  factory CoinSpendingDatum.fromJson(Map<String, dynamic> json) =>
      CoinSpendingDatum(
        id: json["id"],
        name: json["name"],
        coin: json["coin"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "coin": coin,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
      };
}
