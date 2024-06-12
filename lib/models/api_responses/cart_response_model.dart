import 'dart:convert';

CartResponseModel cartResponseModelFromJson(String str) => CartResponseModel.fromJson(json.decode(str));

String cartResponseModelToJson(CartResponseModel data) => json.encode(data.toJson());

class CartResponseModel {
    bool status;
    String message;
    Data data;

    CartResponseModel({
        required this.status,
        required this.message,
        required this.data,
    });

    factory CartResponseModel.fromJson(Map<String, dynamic> json) => CartResponseModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    User user;
    List<Item> items;

    Data({
        required this.user,
        required this.items,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: User.fromJson(json["user"]),
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
    };
}

class Item {
    int quantity;
    Product product;

    Item({
        required this.quantity,
        required this.product,
    });

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        quantity: json["quantity"],
        product: Product.fromJson(json["product"]),
    );

    Map<String, dynamic> toJson() => {
        "quantity": quantity,
        "product": product.toJson(),
    };
}

class Product {
    String productId;
    String name;
    String description;
    int price;
    int coin;
    int stock;
    DateTime createdAt;
    DateTime updatedAt;
    List<Category> category;
    List<Image> images;

    Product({
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

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["product_id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        coin: json["coin"],
        stock: json["stock"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        category: List<Category>.from(json["category"].map((x) => Category.fromJson(x))),
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "product_id": productId,
        "name": name,
        "description": description,
        "price": price,
        "coin": coin,
        "stock": stock,
        "created_at": "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
        "updated_at": "${updatedAt.year.toString().padLeft(4, '0')}-${updatedAt.month.toString().padLeft(2, '0')}-${updatedAt.day.toString().padLeft(2, '0')}",
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

class User {
    String id;
    String username;
    String email;
    String address;

    User({
        required this.id,
        required this.username,
        required this.email,
        required this.address,
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
