import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greeve/routes/app_routes.dart';
import 'package:greeve/services/api/api_auth_service.dart';
import 'package:greeve/services/shared_pref/shared_pref.dart';

class MembershipController extends GetxController {
  final ApiAuthService _apiAuthService = ApiAuthService();
  RxString errorMessage = ''.obs;
  RxMap<String, bool> isSelectedMap = {
    'Lite': false,
    'Epic': false,
    'Boost': false,
  }.obs;

  RxString selectedMembershipPrice = ''.obs;

  RxBool isLoading = false.obs;

  bool get isFormValid {
    if (isLoading.value) return false;

    return isSelectedMap.containsValue(true);
  }

  void postUserMembership() async {
    isLoading.value = true;
    try {
      final String? token = await SharedPreferencesManager.getToken();

      final result = await _apiAuthService.postMembership(
        token,
      );

      if (result.status == true && result.data != null) {}
      Get.toNamed(AppRoutes.membershipSuccess);
    } catch (e) {
      errorMessage.value = e.toString();
      Get.snackbar(
        'Error',
        errorMessage.value,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
      );
    } finally {
      isLoading.value = false;
      clearSelection();
    }
  }

  void selectMembershipPrice(String price) {
    switch (price) {
      case 'Lite':
        selectedMembershipPrice.value = 'Rp30.000';
        break;
      case 'Epic':
        selectedMembershipPrice.value = 'Rp299.000';
        break;
      case 'Boost':
      default:
        selectedMembershipPrice.value = 'Rp149.000';
        break;
    }
  }

  void clearSelection() {
    isSelectedMap.updateAll((key, value) => false);
  }
}
