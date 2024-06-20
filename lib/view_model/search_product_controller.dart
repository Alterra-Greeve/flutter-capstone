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
      'image': ImagesConstant.bottleGrid // Update with correct image path
    },
    {
      'name': 'Tumbler',
      'price': 'Rp 148.500',
      'image': ImagesConstant.bottleGrid // Update with correct image path
    },
    {
      'name': 'Tumbler',
      'price': 'Rp 148.500',
      'image': ImagesConstant.bottleGrid // Update with correct image path
    },
    {
      'name': 'Tumbler',
      'price': 'Rp 148.500',
      'image': ImagesConstant.bottleGrid // Update with correct image path
    },
    {
      'name': 'Tumbler',
      'price': 'Rp 148.500',
      'image': ImagesConstant.bottleGrid // Update with correct image path
    },
    {
      'name': 'Tumbler',
      'price': 'Rp 148.500',
      'image': ImagesConstant.bottleGrid // Update with correct image path
    },
    {
      'name': 'Tumbler',
      'price': 'Rp 148.500',
      'image': ImagesConstant.bottleGrid // Update with correct image path
    },
    {
      'name': 'Tumbler',
      'price': 'Rp 148.500',
      'image': ImagesConstant.bottleGrid // Update with correct image path
    },
    // Add more products here
  ].obs;

  var searchQuery = ''.obs;

  void updateSearchQuery(String query) {
    searchQuery.value = query;
    // Implement search logic here if needed
  }

  void navigateToCart() {
    Get.toNamed('/cart');
  }
}
