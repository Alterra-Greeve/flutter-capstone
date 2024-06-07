class ProductModel {
  String? image;
  String? name;
  String? price;
  String? description;
  

  ProductModel({
    required this.image,
    required this.name,
    this.price,
    this.description,
  });
}