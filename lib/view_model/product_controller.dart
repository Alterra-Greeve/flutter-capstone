import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greeve/models/carousel_item_model.dart';
import 'package:greeve/utils/constants/images_constant.dart';

class ProductController extends GetxController
    with GetSingleTickerProviderStateMixin {
  Rx<int> currentIndex = Rx<int>(0);
  Rx<int> currentCategory = Rx<int>(0);

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
    const Tab(text: 'Dapur'),
    const Tab(text: 'Ruang Tamu'),
    const Tab(text: 'Kamar'),
    const Tab(text: 'Ruang Kerja'),
  ];
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
  final List<ProductModel> productRecommendationItems = [
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
  @override
  void onInit() {
    _tabController = TabController(length: 4, vsync: this);
    super.onInit();
  }

  void updateIndex(int index) {
    currentIndex.value = index;
  }

  void updatePage(int index) {
    currentCategory.value = index;
  }
}
