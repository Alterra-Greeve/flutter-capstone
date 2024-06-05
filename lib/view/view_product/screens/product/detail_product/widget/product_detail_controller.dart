import 'package:get/get.dart';
import 'package:greeve/models/api_responses/product_model.dart';
import 'package:greeve/utils/constants/images_constant.dart';

class ProductDetailController extends GetxController {
  final Product product;

  ProductDetailController(this.product);

  final List<String> productImages = [
    ImagesConstant.bottleCarouselOne,
    ImagesConstant.bottleCarouselTwo,
    ImagesConstant.bottleCarouselThree,
    ImagesConstant.bottleCarouselFour,
  ];

  var currentImageIndex = 0.obs;
  var currentRoundedImageIndex = 0.obs;
  var selectedSize = 'S'.obs;

  void updateImageIndex(int index) {
    currentImageIndex.value = index;
  }

  void updateRoundedImageIndex(int index) {
    currentRoundedImageIndex.value = index;
  }

  void selectSize(String size) {
    selectedSize.value = size;
  }

  final List<Map<String, dynamic>> dataProduct = [
    {
      "Bahan": "Stainless steel 304",
      "Kapasitas": "500 ml (17 oz)",
      "Dimensi": "23 cm x 7 cm (tinggi x diameter)",
      "Berat": "300 gram",
      "Warna": "Silver, Biru, Hijau, Pink",
    },
  ];
}
