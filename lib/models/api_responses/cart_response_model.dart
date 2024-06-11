



import 'dart:convert';

CartResponseModel cartResponseModelFromJson(String str) => CartResponseModel.fromJson(json.decode(str));

String cartResponseModelToJson(CartResponseModel data) => json.encode(data.toJson());

class CartResponseModel {
    bool? status;
    String? message;
    Data? data;

    CartResponseModel({
        this.status,
        this.message,
        this.data,
    });

    factory CartResponseModel.fromJson(Map<String, dynamic> json) => CartResponseModel(
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
    User? user;
    List<Item>? items;

    Data({
        this.user,
        this.items,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
    };
}

class Item {
    int? quantity;
    Product? product;

    Item({
        this.quantity,
        this.product,
    });

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        quantity: json["quantity"],
        product: json["product"] == null ? null : Product.fromJson(json["product"]),
    );

    Map<String, dynamic> toJson() => {
        "quantity": quantity,
        "product": product?.toJson(),
    };
}

class Product {
    String? productId;
    String? name;
    String? description;
    int? price;
    int? coin;
    int? stock;
    DateTime? createdAt;
    DateTime? updatedAt;
    List<Category>? category;
    List<Image>? images;

    Product({
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

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["product_id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        coin: json["coin"],
        stock: json["stock"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        category: json["category"] == null ? [] : List<Category>.from(json["category"]!.map((x) => Category.fromJson(x))),
        images: json["images"] == null ? [] : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "product_id": productId,
        "name": name,
        "description": description,
        "price": price,
        "coin": coin,
        "stock": stock,
        "created_at": "${createdAt!.year.toString().padLeft(4, '0')}-${createdAt!.month.toString().padLeft(2, '0')}-${createdAt!.day.toString().padLeft(2, '0')}",
        "updated_at": "${updatedAt!.year.toString().padLeft(4, '0')}-${updatedAt!.month.toString().padLeft(2, '0')}-${updatedAt!.day.toString().padLeft(2, '0')}",
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

class User {
    String? id;
    String? username;
    String? email;
    String? address;

    User({
        this.id,
        this.username,
        this.email,
        this.address,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        address: json["address"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "address": address,
    };
}
