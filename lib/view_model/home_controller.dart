import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:greeve/models/api_responses/get_user_profile_response_model.dart';
import 'package:greeve/services/api/api_user_serpice.dart';
import 'package:greeve/services/shared_pref/shared_pref.dart';

class HomeController extends GetxController {
  final ApiUserService _apiUserService = ApiUserService();
  Rx<GetUserProfileResponseModel?> userProfileData =
      Rx<GetUserProfileResponseModel?>(null);
  Rx<String?> errorMessage = Rx<String?>(null);
  Rx<bool> isLoading = Rx<bool>(false);

  @override
  void onInit() {
    getUserProfile();
    super.onInit();
  }

  void getUserProfile() async {
    final String? token = await SharedPreferencesManager.getToken();
    if (kDebugMode) {
      print('token: $token');
    }
    isLoading.value = true;
    try {
      final result = await _apiUserService.getUserProfile(token);
      userProfileData.value = result;
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
