import 'package:get/get.dart';
import 'package:greeve/models/carousel_item_model.dart';
import 'package:greeve/utils/constants/images_constant.dart';

class CartController extends GetxController {
  final List<ProductModel> cartItems = [
    ProductModel(
      image: ImagesConstant.recommendationImagePlaceholder,
      name: 'Wadah Makanan Kaca',
      description:
          'Wadah makanan kaca adalah solusi sempurna untuk menyimpan makanan dengan aman dan praktis.',
      price: "148.500",
    ),
    ProductModel(
      image: ImagesConstant.recommendationImagePlaceholder,
      name: 'Wadah Makanan Kaca',
      description:
          'Wadah makanan kaca adalah solusi sempurna untuk menyimpan makanan dengan aman dan praktis.',
      price: "148.500",
    ),
    ProductModel(
      image: ImagesConstant.recommendationImagePlaceholder,
      name: 'Wadah Makanan Kaca',
      description:
          'Wadah makanan kaca adalah solusi sempurna untuk menyimpan makanan dengan aman dan praktis.',
      price: "148.500",
    ),
  ];
}