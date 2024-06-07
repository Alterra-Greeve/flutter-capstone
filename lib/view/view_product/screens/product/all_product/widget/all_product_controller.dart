
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greeve/models/api_responses/product_response_model.dart';
import 'package:greeve/services/api/api_service.dart';
import 'package:greeve/services/shared_pref/shared_pref.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';

class AllProductController extends GetxController {
  final ApiService _apiService = ApiService();
  Rx<ProductResponseModel?> productData = Rx<ProductResponseModel?>(null);

  Rx<String?> errorMessage = Rx<String?>(null);


  void getToken() async {
    try {
      final token = await SharedPreferencesManager.getToken();
      if (token != null) {
        getProduct(token);
      } else {
        if (kDebugMode) {
          print("Token not found!");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error getting token: $e");
      }
    }
  }

  void getProduct(String token) async {
    try {
      final result = await _apiService.getProducts(token);
      productData.value = productResponseModelFromJson(result as String);
    } catch (e) {
      errorMessage.value = e.toString();
      showProductFailedDialog(errorMessage.value ?? '');
    }
  }

  void showProductFailedDialog(String errorMessage) {
    Get.defaultDialog(
      backgroundColor: ColorsConstant.white,
      title: 'Gagal Ngambil Data Productt!',
      titleStyle: TextStylesConstant.nunitoHeading3.copyWith(
        fontWeight: FontWeight.w600,
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 24),
      content: Padding(
        padding: const EdgeInsets.only(
          bottom: 24,
          left: 24,
          right: 24,
        ),
        child: Text(
          errorMessage,
          textAlign: TextAlign.center,
          style: TextStylesConstant.nunitoSubtitle.copyWith(
            color: ColorsConstant.neutral600,
          ),
        ),
      ),
      confirm: InkWell(
        onTap: () {
          Get.back();
        },
        child: Ink(
          width: 250,
          height: 48,
          decoration: BoxDecoration(
            border: Border.all(
              color: ColorsConstant.primary500,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: Center(
            child: Text(
              'Coba Kembali',
              style: TextStylesConstant.nunitoButtonLarge
                  .copyWith(color: ColorsConstant.primary500),
            ),
          ),
        ),
      ),
    );
  }
}
