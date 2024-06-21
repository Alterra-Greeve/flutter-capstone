// ignore_for_file: constant_identifier_names

import 'dart:convert';

ProductsRecommendationResponseModel productsRecommendationResponseModelFromJson(
        String str) =>
    ProductsRecommendationResponseModel.fromJson(json.decode(str));

String productsRecommendationResponseModelToJson(
        ProductsRecommendationResponseModel data) =>
    json.encode(data.toJson());

class ProductsRecommendationResponseModel {
  bool? status;
  String? message;
  List<Datum>? data;

  ProductsRecommendationResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory ProductsRecommendationResponseModel.fromJson(
          Map<String, dynamic> json) =>
      ProductsRecommendationResponseModel(
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
  String? productId;
  String? name;
  String? description;
  int? price;
  int? coin;
  int? stock;
  String? createdAt;
  String? updatedAt;
  List<Category>? category;
  List<Image>? images;

  Datum({
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

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
            : List<Category>.from(
                json["category"]!.map((x) => Category.fromJson(x))),
        images: json["images"] == null
            ? []
            : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
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
        "category": category == null
            ? []
            : List<dynamic>.from(category!.map((x) => x.toJson())),
        "images": images == null
            ? []
            : List<dynamic>.from(images!.map((x) => x.toJson())),
      };
}

class Category {
  ImpactCategory? impactCategory;

  Category({
    this.impactCategory,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        impactCategory: json["impact_category"] == null
            ? null
            : ImpactCategory.fromJson(json["impact_category"]),
      );

  Map<String, dynamic> toJson() => {
        "impact_category": impactCategory?.toJson(),
      };
}

class ImpactCategory {
  Name? name;
  int? impactPoint;
  String? iconUrl;

  ImpactCategory({
    this.name,
    this.impactPoint,
    this.iconUrl,
  });

  factory ImpactCategory.fromJson(Map<String, dynamic> json) => ImpactCategory(
        name: nameValues.map[json["name"]]!,
        impactPoint: json["impact_point"],
        iconUrl: json["icon_url"],
      );

  Map<String, dynamic> toJson() => {
        "name": nameValues.reverse[name],
        "impact_point": impactPoint,
        "icon_url": iconUrl,
      };
}

enum Name {
  HEMAT_UANG,
  MENGURANGI_PEMANASAN_GLOBAL,
  PERLUAS_WAWASAN,
  UMBUL_PONGGOK_BARU,
  MENGURANGI_LIMBAH
}

final nameValues = EnumValues({
  "Hemat Uang": Name.HEMAT_UANG,
  "Mengurangi Pemanasan Global": Name.MENGURANGI_PEMANASAN_GLOBAL,
  "Perluas Wawasan": Name.PERLUAS_WAWASAN,
  "Umbul Ponggok Baru": Name.UMBUL_PONGGOK_BARU,
  "Mengurangi Limbah": Name.MENGURANGI_LIMBAH
});

class Image {
  String? imageUrl;
  int? position;

  Image({
    this.imageUrl,
    this.position,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        imageUrl: json["image_url"],
        position: json["position"],
      );

  Map<String, dynamic> toJson() => {
        "image_url": imageUrl,
        "position": position,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
