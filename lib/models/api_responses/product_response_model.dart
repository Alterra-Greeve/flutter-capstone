import 'dart:convert';

ProductResponseModel productResponseModelFromJson(String str) => ProductResponseModel.fromJson(json.decode(str));

String productResponseModelToJson(ProductResponseModel data) => json.encode(data.toJson());

class ProductResponseModel {
  bool? status;
  String? message;
  List<Data>? data;

  ProductResponseModel({this.status, this.message, this.data});

  factory ProductResponseModel.fromJson(Map<String, dynamic> json) {
    return ProductResponseModel(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null
          ? List<Data>.from(json['data'].map((x) => Data.fromJson(x)))
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'data': data != null ? List<dynamic>.from(data!.map((x) => x.toJson())) : null,
  };
}

class Data {
  String? productId;
  String? name;
  String? description;
  int? price;
  int? coin;
  int? currentPage;
  int? totalPage;
  List<Category>? category;
  List<ImageData>? images;

  Data({
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

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      productId: json['product_id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      coin: json['coin'],
      currentPage: json['current_page'],
      totalPage: json['total_page'],
      category: json['category'] != null
          ? List<Category>.from(json['category'].map((x) => Category.fromJson(x)))
          : null,
      images: json['images'] != null
          ? List<ImageData>.from(json['images'].map((x) => ImageData.fromJson(x)))
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'product_id': productId,
    'name': name,
    'description': description,
    'price': price,
    'coin': coin,
    'current_page': currentPage,
    'total_page': totalPage,
    'category': category != null ? List<dynamic>.from(category!.map((x) => x.toJson())) : null,
    'images': images != null ? List<dynamic>.from(images!.map((x) => x.toJson())) : null,
  };
}

class Category {
  String? id;
  String? productId;
  String? impactCategoryId;

  Category({this.id, this.productId, this.impactCategoryId});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      productId: json['product_id'],
      impactCategoryId: json['impact_category_id'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'product_id': productId,
    'impact_category_id': impactCategoryId,
  };
}

class ImageData {
  String? id;
  String? productId;
  String? imageUrl;
  int? position;

  ImageData({this.id, this.productId, this.imageUrl, this.position});

  factory ImageData.fromJson(Map<String, dynamic> json) {
    return ImageData(
      id: json['id'],
      productId: json['product_id'],
      imageUrl: json['image_url'],
      position: json['position'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'product_id': productId,
    'image_url': imageUrl,
    'position': position,
  };
}
