import 'dart:convert';

ProductsResponseModel productsResponseModelFromJson(String str) =>
    ProductsResponseModel.fromJson(json.decode(str));

String productsResponseModelToJson(ProductsResponseModel data) =>
    json.encode(data.toJson());

class ProductsResponseModel {
  bool? status;
  String? message;
  List<List<Datum>>? data;

  ProductsResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory ProductsResponseModel.fromJson(Map<String, dynamic> json) =>
      ProductsResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<List<Datum>>.from(json["data"]!
                .map((x) => List<Datum>.from(x.map((x) => Datum.fromJson(x))))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(
                data!.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
      };
}

class Datum {
  String? productId;
  String? name;
  String? description;
  int? price;
  int? coin;
  int? currentPage;
  int? totalPage;
  List<Category>? category;
  List<Image>? images;

  Datum({
    this.productId,
    this.name,
    this.description,
    this.price,
    this.coin,
    this.currentPage,
    this.totalPage,
    this.category,
    this.images,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        productId: json["product_id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        coin: json["coin"],
        currentPage: json["current_page"],
        totalPage: json["total_page"],
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
        "current_page": currentPage,
        "total_page": totalPage,
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

  ImpactCategory({
    this.name,
    this.impactPoint,
  });

  factory ImpactCategory.fromJson(Map<String, dynamic> json) => ImpactCategory(
        name: nameValues.map[json["name"]]!,
        impactPoint: json["impact_point"],
      );

  Map<String, dynamic> toJson() => {
        "name": nameValues.reverse[name],
        "impact_point": impactPoint,
      };
}

enum Name { ecoFriendly, lessWaste, veryGreen }

final nameValues = EnumValues({
  "Eco Friendly": Name.ecoFriendly,
  "Less Waste": Name.lessWaste,
  "Very Green": Name.veryGreen
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
