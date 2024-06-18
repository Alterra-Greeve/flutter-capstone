



import 'dart:convert';

ProductResponseModel productResponseModelFromJson(String str) => ProductResponseModel.fromJson(json.decode(str));

String productResponseModelToJson(ProductResponseModel data) => json.encode(data.toJson());

class ProductResponseModel {
    bool? status;
    String? message;
    Data? data;

    ProductResponseModel({
        this.status,
        this.message,
        this.data,
    });

    factory ProductResponseModel.fromJson(Map<String, dynamic> json) => ProductResponseModel(
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
    List<Category>? category;
    List<Image>? images;

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
        productId: json["product_id"] == "" ? null : json["product_id"],
        name: json["name"] == "" ? null : json["name"],
        description: json["description"] == "" ? null : json["description"],
        price: json["price"],
        coin: json["coin"],
        stock: json["stock"],
        createdAt: json["created_at"] == "" ? null : json["created_at"],
        updatedAt: json["updated_at"] == "" ? null : json["updated_at"],
        category: json["category"] == null
            ? []
            : List<Category>.from(json["category"]!.map((x) => Category.fromJson(x))),
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
        "category": category == null ? [] : List<dynamic>.from(category!.map((x) => x.toJson())),
        "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x.toJson())),
    };
}

class Category {
    ImpactCategory? impactCategory;

    Category({
        this.impactCategory,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        impactCategory: json["impact_category"] == null ? null : ImpactCategory.fromJson(json["impact_category"]),
    );

    Map<String, dynamic> toJson() => {
        "impact_category": impactCategory?.toJson(),
    };
}

class ImpactCategory {
    String? name;
    int? impactPoint;
    String? iconUrl;

    ImpactCategory({
        this.name,
        this.impactPoint,
        this.iconUrl,
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
