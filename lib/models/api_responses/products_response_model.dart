import 'dart:convert';

ProductsResponseModel productsResponseModelFromJson(String str) =>
    ProductsResponseModel.fromJson(json.decode(str));

String productsResponseModelToJson(ProductsResponseModel data) =>
    json.encode(data.toJson());

class ProductsResponseModel {
  bool status;
  String message;
  Metadata metadata;
  List<Datum> data;

  ProductsResponseModel({
    required this.status,
    required this.message,
    required this.metadata,
    required this.data,
  });

  factory ProductsResponseModel.fromJson(Map<String, dynamic> json) =>
      ProductsResponseModel(
        status: json["status"],
        message: json["message"],
        metadata: Metadata.fromJson(json["metadata"]),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "metadata": metadata.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  String productId;
  String name;
  String description;
  int price;
  int coin;
  int stock;
  String createdAt;
  String updatedAt;
  List<Category> category;
  List<Image> images;

  Datum({
    required this.productId,
    required this.name,
    required this.description,
    required this.price,
    required this.coin,
    required this.stock,
    required this.createdAt,
    required this.updatedAt,
    required this.category,
    required this.images,
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
        category: List<Category>.from(
            json["category"].map((x) => Category.fromJson(x))),
        images: json["images"] != null && (json["images"] as List).isNotEmpty
            ? List<Image>.from(json["images"].map((x) => Image.fromJson(x)))
            : [
                Image(
                    imageUrl:
                        'https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png',
                    position: 0)
              ],
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
        "category": List<dynamic>.from(category.map((x) => x.toJson())),
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
      };
}

class Category {
  ImpactCategory impactCategory;

  Category({
    required this.impactCategory,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        impactCategory: ImpactCategory.fromJson(json["impact_category"]),
      );

  Map<String, dynamic> toJson() => {
        "impact_category": impactCategory.toJson(),
      };
}

class ImpactCategory {
  String name;
  int impactPoint;
  String iconUrl;

  ImpactCategory({
    required this.name,
    required this.impactPoint,
    required this.iconUrl,
  });

  factory ImpactCategory.fromJson(Map<String, dynamic> json) => ImpactCategory(
        name: json["name"],
        impactPoint: json["impact_point"],
        iconUrl: json["icon_url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "impact_point": impactPoint,
        "icon_url": iconUrl,
      };
}

class Image {
  String imageUrl;
  int position;

  Image({
    required this.imageUrl,
    required this.position,
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

class Metadata {
  int totalPage;
  int currentPage;

  Metadata({
    required this.totalPage,
    required this.currentPage,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        totalPage: json["total_page"],
        currentPage: json["current_page"],
      );

  Map<String, dynamic> toJson() => {
        "total_page": totalPage,
        "current_page": currentPage,
      };
}
