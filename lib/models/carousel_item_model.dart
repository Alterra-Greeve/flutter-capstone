class ProductModel {
  String? image;
  String? name;
  String? price;
  String? description;
  String? productId;
  

  ProductModel({
    required this.image,
    required this.name,
    this.price,
    this.description,
    this.productId,
  });
}