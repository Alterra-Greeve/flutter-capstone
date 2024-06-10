import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greeve/models/api_responses/product_response_model.dart';
import 'package:greeve/services/api/api_service.dart';
import 'package:greeve/services/shared_pref/shared_pref.dart';

class DetailProductController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final ApiService _apiService = ApiService();

  Rx<int> currentImageIndex = Rx<int>(0);
  Rx<int> currentRoundedImageIndex = Rx<int>(0);
  Rx<bool> isLoading = Rx<bool>(false);
  Rx<String?> errorMessage = Rx<String?>(null);
  Rx<Data?> productData = Rx<Data?>(null);
  RxList<String> productImages = <String>[].obs;

  late TabController _tabController;
  TabController get tabController => _tabController;

  final CarouselController _buttonCarouselController = CarouselController();
  CarouselController get buttonCarouselController => _buttonCarouselController;

  @override
  void onInit() {
    getProduct();
    super.onInit();
  }

  void updateImageIndex(int index) {
    currentImageIndex.value = index;
    _buttonCarouselController.jumpToPage(index);
  }

  void updateRoundedImageIndex(int index) {
    currentRoundedImageIndex.value = index;
  }

  void getProduct() async {
    final String productId = Get.arguments;
    final String? token = await SharedPreferencesManager.getToken();
    productData.value = null;
    productImages.value = [];
    isLoading.value = true;
    try {
      final result = await _apiService.getProduct(productId, token);
      productData.value = result.data;
      productImages = RxList<String>.from(
        result.data!.images!.map((e) => e.imageUrl!).toList(),
      );
      errorMessage.value = '';
      _tabController = TabController(length: productImages.length, vsync: this);
    } catch (e) {
      errorMessage.value = e.toString();
      Get.snackbar(
        'Error',
        errorMessage.value ?? '',
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
      );
    } finally {
      isLoading.value = false;
    }
  }
}
