import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greeve/models/api_responses/product_response_model.dart';
import 'package:greeve/services/api/api_service.dart';
import 'package:greeve/services/shared_pref/shared_pref.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';

class ListHorizontalController extends GetxController {
  var isLoading = true.obs;
  var productList = <Data>[].obs;
  Rx<String> errorMessage = ''.obs;

  final ApiService _apiService = ApiService();

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    try {
      String? token = await SharedPreferencesManager.getToken();
      if (token != null) {
        isLoading(true);
        final response = await _apiService.getProducts(token);
        if (response.status == true) {
          //productList.value = response.data ?? [];
        } else {
          errorMessage.value = response.message ?? "Failed to fetch products";
          showProductFailedDialog(errorMessage.value);
        }
      } else {
        errorMessage.value = "Token not found!";
        showProductFailedDialog(errorMessage.value);
      }
    } catch (e) {
      errorMessage.value = e.toString();
      showProductFailedDialog(errorMessage.value);
    } finally {
      isLoading(false);
    }
  }

  void showProductFailedDialog(String errorMessage) {
    Get.defaultDialog(
      backgroundColor: ColorsConstant.white,
      title: 'Failed to Fetch Products!',
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
              'Retry',
              style: TextStylesConstant.nunitoButtonLarge
                  .copyWith(color: ColorsConstant.primary500),
            ),
          ),
        ),
      ),
    );
  }
}
