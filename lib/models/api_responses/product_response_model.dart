import 'dart:convert';

ProductResponseModel productResponseModelFromJson(String str) =>
    ProductResponseModel.fromJson(json.decode(str));

String productResponseModelToJson(ProductResponseModel data) =>
    json.encode(data.toJson());

class ProductResponseModel {
  bool? status;
  String? message;
  Data? data;

  ProductResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory ProductResponseModel.fromJson(Map<String, dynamic> json) =>
      ProductResponseModel(
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
  String? productId;
  String? name;
  String? description;
  int? price;
  int? coin;
  int? stock;
  String? createdAt;
  String? updatedAt;
  List<dynamic>? category;
  List<dynamic>? images;

  Data({
    this.productId,
    this.name,
    this.description,
    this.price,
    this.coin,
    this.stock,
    this.createdAt,
    this.updatedAt,
    this.category,
    this.images,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        productId: json["product_id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        coin: json["coin"],
        stock: json["stock"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        category: json["category"] == null
            ? []
            : List<dynamic>.from(json["category"]!.map((x) => x)),
        images: json["images"] == null
            ? []
            : List<dynamic>.from(json["images"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "name": name,
        "description": description,
        "price": price,
        "coin": coin,
        "stock": stock,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "category":
            category == null ? [] : List<dynamic>.from(category!.map((x) => x)),
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
      };
}
