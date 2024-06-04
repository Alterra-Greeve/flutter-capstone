import 'package:get/get.dart';
import 'package:greeve/models/carousel_item_model.dart';
import 'package:greeve/utils/constants/images_constant.dart';

class AllProductScreenController extends GetxController {
  final List<ProductModel> productItems = [
    ProductModel(
      image: ImagesConstant.productImagePlaceholder,
      name: 'Tumbler',
      description: 'Botol air',
      price: "148.500",
    ),
    ProductModel(
      image: ImagesConstant.productImagePlaceholder,
      name: 'Tumbler',
      description: 'Botol air',
      price: "148.500",
    ),
    ProductModel(
      image: ImagesConstant.productImagePlaceholder,
      name: 'Tumbler',
      description: 'Botol air',
      price: "148.500",
    ),
    ProductModel(
      image: ImagesConstant.productImagePlaceholder,
      name: 'Tumbler',
      description: 'Botol air',
      price: "148.500",
    ),
  ];
}