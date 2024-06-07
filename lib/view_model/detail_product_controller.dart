import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greeve/utils/constants/images_constant.dart';

class DetailProductController extends GetxController with GetSingleTickerProviderStateMixin {
  Rx<int> currentImageIndex = Rx<int>(0);
  Rx<int> currentRoundedImageIndex = Rx<int>(0);

  late TabController _tabController;
  TabController get tabController => _tabController;
  
  final List<String> productImages =[
    ImagesConstant.detailProductImagePlaceholder,
    ImagesConstant.detailProductImagePlaceholder,
    ImagesConstant.detailProductImagePlaceholder,
    ImagesConstant.detailProductImagePlaceholder,
  ];

  @override
  void onInit() {
    _tabController = TabController(length: 4, vsync: this);
    super.onInit();
  }

  void updateImageIndex(int index) {
    currentImageIndex.value = index;
  }

  void updateRoundedImageIndex(int index) {
    currentRoundedImageIndex.value = index;
  }
}