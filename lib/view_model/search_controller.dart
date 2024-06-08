import 'package:get/get.dart';
import 'package:greeve/utils/constants/images_constant.dart';

class SearchProductController extends GetxController {
  var isTextFieldFocused = false.obs;

  void setFocus(bool isFocused) {
    isTextFieldFocused.value = isFocused;
  }

  var products = [
    {
      'name': 'Tumbler',
      'price': 'Rp 148.500',
      'image': ImagesConstant.bottleGrid
    },
    {
      'name': 'Tumbler',
      'price': 'Rp 148.500',
      'image': ImagesConstant.bottleGrid
    },
    {
      'name': 'Tumbler',
      'price': 'Rp 148.500',
      'image': ImagesConstant.bottleGrid
    },
    {
      'name': 'Tumbler',
      'price': 'Rp 148.500',
      'image': ImagesConstant.bottleGrid
    },
    {
      'name': 'Tumbler',
      'price': 'Rp 148.500',
      'image': ImagesConstant.bottleGrid
    },
    {
      'name': 'Tumbler',
      'price': 'Rp 148.500',
      'image': ImagesConstant.bottleGrid
    },
    {
      'name': 'Tumbler',
      'price': 'Rp 148.500',
      'image': ImagesConstant.bottleGrid
    },
    {
      'name': 'Tumbler',
      'price': 'Rp 148.500',
      'image': ImagesConstant.bottleGrid
    },
  ].obs;

  var searchQuery = ''.obs;

  void updateSearchQuery(String query) {
    searchQuery.value = query;
  }

  void navigateToCart() {
    Get.toNamed('/cart');
  }
}
