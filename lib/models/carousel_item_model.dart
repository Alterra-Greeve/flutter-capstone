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

  class GetCoinAndVoucher {
  String? image;
  String? name;
  String? title;

  GetCoinAndVoucher({
    required this.image,
    required this.name,
    required this.title,
  });
  }