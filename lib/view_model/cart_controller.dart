import 'package:get/get.dart';
import 'package:greeve/models/carousel_item_model.dart';
import 'package:greeve/utils/constants/images_constant.dart';

class CartController extends GetxController {
  Rx<bool> isCoinApplied = false.obs;

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

  void toggleCoinSwitch() {
    isCoinApplied.value = !isCoinApplied.value;
    updateTotalPrice();
  }

  void updateTotalPrice() {
    // double discount = isCoinApplied.value ? 5 : 0;
    // totalPrice.value =
    //     218400 - discount; // Assuming a fixed price for simplicity
  }
}
