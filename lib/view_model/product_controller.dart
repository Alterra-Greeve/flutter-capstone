import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greeve/models/api_responses/products_response_model.dart';
import 'package:greeve/models/carousel_item_model.dart';
import 'package:greeve/services/api/api_service.dart';
import 'package:greeve/services/shared_pref/shared_pref.dart';
import 'package:greeve/utils/constants/images_constant.dart';

class ProductController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final ApiService _apiService = ApiService();

  Rx<int> currentIndex = Rx<int>(0);
  Rx<int> currentCategory = Rx<int>(0);
  Rx<bool> isLoading = Rx<bool>(false);
  Rx<String?> errorMessage = Rx<String?>(null);
  RxList<Datum> productsData = <Datum>[].obs;
  RxList<Datum> productsRecommendationData = <Datum>[].obs;

  late TabController _tabController;
  TabController get tabController => _tabController;

  final List<ProductModel> carouselItems = [
    ProductModel(
      image: ImagesConstant.carouselProductImage1,
      name: 'Sedotan Besi',
    ),
    ProductModel(
      image: ImagesConstant.carouselProductImage2,
      name: 'Sikat Gigi Bambu',
    ),
    ProductModel(
      image: ImagesConstant.carouselProductImage3,
      name: 'Botol Minum',
    ),
  ];
  final List<Tab> categoryTabs = <Tab>[
    const Tab(text: 'Eco-Friendly'),
    const Tab(text: 'Energy Efficient'),
    const Tab(text: 'Compostable'),
    const Tab(text: 'Fair Trade'),
    const Tab(text: 'Reusable'),
    const Tab(text: 'Biodegradable'),
  ];

  @override
  void onInit() {
    _tabController = TabController(length: 6, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        getProductsbyCategory(categoryTabs[_tabController.index].text!);
      }
    });
    getProductsbyCategory(categoryTabs[0].text!);
    getProducts();
    super.onInit();
  }

  void updateIndex(int index) {
    currentIndex.value = index;
  }

  void updatePage(int index) {
    currentCategory.value = index;
  }

  void getProductsbyCategory(String category) async {
    final String? token = await SharedPreferencesManager.getToken();
    productsData.value = [];
    isLoading.value = true;
    try {
      final result = await _apiService.getProductsbyCategory(token, category);
      productsData.value = result.data!;
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
      isLoading.value = false;
    }
  }

  void getProducts() async {
    final String? token = await SharedPreferencesManager.getToken();
    productsRecommendationData.value = [];
    isLoading.value = true;
    try {
      final result = await _apiService.getProducts(token);
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
      isLoading.value = false;
    }
  }
}
