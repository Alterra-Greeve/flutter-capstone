import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greeve/models/api_responses/generic_response_model.dart';
import 'package:greeve/routes/app_routes.dart';
import 'package:greeve/services/api/api_auth_service.dart';
import 'package:greeve/services/shared_pref/shared_pref.dart';

class ForgotPasswordController extends GetxController {
  final ApiAuthService _apiService = ApiAuthService();

  Rx<bool> isFormValid = Rx<bool>(false);
  Rx<String?> emailErrorText = Rx<String?>(null);
  Rx<bool> isLoading = Rx<bool>(false);
  Rx<GenericResponseModel?> responseData = Rx<GenericResponseModel?>(null);
  Rx<String?> errorMessage = Rx<String?>(null);

  final TextEditingController _emailController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();

  TextEditingController get emailController => _emailController;
  FocusNode get emailFocusNode => _emailFocusNode;

  @override
  void onInit() {
    _emailFocusNode.addListener(() => update());
    _emailController.addListener(validateForm);
    super.onInit();
  }

  void postForgotPassword() async {
    isLoading.value = true;
    try {
      final String? token = await SharedPreferencesManager.getToken();

      final result = await _apiService.postForgotPassword(
        _emailController.text,
        token,
      );
      responseData.value = result;
      SharedPreferencesManager.saveForgotPasswordEmail(
          email: _emailController.text);
      Get.offNamed(AppRoutes.otp);
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

  void validateEmail(String value) {
    final RegExp emailRegex = RegExp(
        r"""^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?$""");
    if (!emailRegex.hasMatch(value)) {
      emailErrorText.value = 'Email tidak valid! contoh: johndoe123@gmail.com';
    } else {
      emailErrorText.value = null;
    }
    validateForm();
  }

  void validateForm() {
    if (emailErrorText.value != null || _emailController.text == '') {
      isFormValid.value = false;
    } else {
      isFormValid.value = true;
    }
  }

  void clearForm() {
    _emailController.clear();
    emailErrorText.value = null;
    isFormValid.value = false;
  }
}
