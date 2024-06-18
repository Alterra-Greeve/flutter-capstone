import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greeve/models/api_responses/products_response_model.dart' as products;
import 'package:greeve/models/api_responses/products_recommendation_response_model.dart' as products_recommendation;
import 'package:greeve/models/carousel_item_model.dart';
import 'package:greeve/routes/app_routes.dart';
import 'package:greeve/services/api/api_product_service.dart';
import 'package:greeve/services/shared_pref/shared_pref.dart';
import 'package:greeve/utils/constants/images_constant.dart';

class ProductController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final ApiProductService _apiService = ApiProductService();
  Rx<int> currentIndex = Rx<int>(0);
  Rx<int> currentCategory = Rx<int>(0);
  Rx<bool> isLoadingProduct = Rx<bool>(false);
  Rx<bool> isLoadingRecommendation = Rx<bool>(false);
  Rx<String?> errorMessage = Rx<String?>(null);
  RxList<products.Datum> productsData = <products.Datum>[].obs;
  RxList<products_recommendation.Datum> productsRecommendationData = <products_recommendation.Datum>[].obs;

  late TabController _tabController;
  TabController get tabController => _tabController;

  final List<ProductModel> carouselItems = [
    ProductModel(
      image: ImagesConstant.carouselProductImage1,
      name: 'Sedotan Besi',
      productId: '7dcf0f20-d1c6-4d8a-8cf5-de60f5c420be',
    ),
    ProductModel(
      image: ImagesConstant.carouselProductImage2,
      name: 'Sikat Gigi Bambu',
      productId: '7c45085a-2466-4f5e-9ccd-bdd139751dac',
    ),
    ProductModel(
      image: ImagesConstant.carouselProductImage3,
      name: 'Botol Minum',
      productId: '7dc84308-0330-41f1-8072-ca635e5055c8',
    ),
  ];
  final List<Tab> categoryTabs = <Tab>[
    const Tab(text: 'Hemat Uang'),
    const Tab(text: 'Kurangi Limbah'),
    const Tab(text: 'Perluas Wawasan'),
    const Tab(text: 'Kurangi Pemanasan'),
  ];

  @override
  void onInit() {
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        getProductsbyCategory(categoryTabs[_tabController.index].text!);
      }
    });
    getProductsbyCategory(categoryTabs[0].text!);
    getProductsRecommendation();
    super.onInit();
  }

  void updateIndex(int index) {
    currentIndex.value = index;
  }

  void updatePage(int index) {
    currentCategory.value = index;
  }

  void getProductsbyCategory(String category) async {
    try {
      if (category == 'Kurangi Limbah') {
        category = 'Mengurangi Limbah';
      } else if (category == 'Kurangi Pemanasan') {
        category = 'Mengurangi Pemanasan Global';
      }
      final String? token = await SharedPreferencesManager.getToken();
      productsData.value = [];
      isLoadingProduct.value = true;
      final result = await _apiService.getProductsbyCategory(token, category);
      productsData.value = result.data;
      errorMessage.value = '';
    } catch (e) {
      errorMessage.value = e.toString();
      Get.snackbar(
        'Error',
        errorMessage.value ?? '',
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
      );
    } finally {
      isLoadingProduct.value = false;
    }
  }

  void getProductsRecommendation() async {
    try {
      final String? token = await SharedPreferencesManager.getToken();
      productsRecommendationData.value = [];
      isLoadingRecommendation.value = true;
      final result = await _apiService.getProductsRecommendation(token);
      if (kDebugMode) {
        print(result);
      }
      productsRecommendationData.value = result.data!;
      errorMessage.value = '';
    } catch (e) {
      errorMessage.value = e.toString();
      Get.snackbar(
        'Error',
        errorMessage.value ?? '',
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
      );
    } finally {
      isLoadingRecommendation.value = false;
    }
  }

  void navigateToProductDetail(String productId) {
    Get.toNamed(
      AppRoutes.detailProduct,
      arguments: productId,
    );
  }

  void navigateToSeeAllProducts() {
    final currentCategoryName = categoryTabs[_tabController.index].text;
    Get.toNamed(
      AppRoutes.allProduct,
      arguments: currentCategoryName,
    );
  }
}
