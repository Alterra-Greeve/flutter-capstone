import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greeve/models/api_responses/generic_response_model.dart';
import 'package:greeve/models/api_responses/product_response_model.dart';
import 'package:greeve/services/api/api_cart_service.dart';
import 'package:greeve/services/api/api_product_service.dart';
import 'package:greeve/services/shared_pref/shared_pref.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';

class DetailProductController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final ApiProductService _apiProductService = ApiProductService();
  final ApiCartService _apiCartService = ApiCartService();
  Rx<int> currentImageIndex = Rx<int>(0);
  Rx<int> currentRoundedImageIndex = Rx<int>(0);
  Rx<bool> isLoadingProduct = Rx<bool>(false);
  Rx<bool> isLoadingCartPost = Rx<bool>(false);
  Rx<String?> errorMessage = Rx<String?>(null);
  Rx<Data?> productData = Rx<Data?>(null);
  RxList<String> productImages = <String>[].obs;
  RxList<String> impactCategories = <String>[].obs;
  Rx<GenericResponseModel?> cartResponseData = Rx<GenericResponseModel?>(null);

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
    currentRoundedImageIndex.value = index;
    _buttonCarouselController.jumpToPage(index);
  }

  void getProduct() async {
    try {
      final String productId = Get.arguments;
      final String? token = await SharedPreferencesManager.getToken();
      productData.value = null;
      productImages.value = [];
      isLoadingProduct.value = true;
      final result = await _apiProductService.getProduct(productId, token);
      productData.value = result.data;
      productImages = RxList<String>.from(
        result.data!.images!.map((e) => e.imageUrl!).toList(),
      );
      impactCategories.value = result.data?.category?.map((category) {
            return category.impactCategory?.name ?? '';
          }).toList() ??
          [];
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
      isLoadingProduct.value = false;
    }
  }

  void postCart() async {
    try {
      final String productId = Get.arguments;
      final String? token = await SharedPreferencesManager.getToken();
      isLoadingCartPost.value = true;
      final result = await _apiCartService.postCart(productId, token);
      cartResponseData.value = result;
      showSuccessSnackbar();
    } catch (e) {
      errorMessage.value = e.toString();
      Get.snackbar(
        'Error',
        errorMessage.value ?? '',
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
      );
    } finally {
      isLoadingCartPost.value = false;
    }
  }

  void showSuccessSnackbar() {
    Get.rawSnackbar(
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.only(bottom: 70, right: 16, left: 16),
      padding: const EdgeInsets.all(0),
      backgroundColor: ColorsConstant.neutral100,
      borderRadius: 8,
      duration: const Duration(seconds: 3),
      messageText: Container(
        padding: const EdgeInsets.all(12),
        height: 56,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(IconsConstant.success),
                const SizedBox(width: 12),
                Text(
                  'Produk telah ditambahkan ke keranjang',
                  style: TextStylesConstant.nunitoButtonLarge.copyWith(
                    color: ColorsConstant.neutral900,
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () => Get.back(),
              child: SvgPicture.asset(
                IconsConstant.close,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
