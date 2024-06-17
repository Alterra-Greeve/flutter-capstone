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
