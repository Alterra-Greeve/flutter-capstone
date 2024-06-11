import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greeve/models/api_responses/generic_response_model.dart';
import 'package:greeve/routes/app_routes.dart';
import 'package:greeve/services/api/api_auth_service.dart';
import 'package:greeve/services/shared_pref/shared_pref.dart';

class CreateNewPasswordController extends GetxController {
  final ApiAuthService _apiService = ApiAuthService();
  Rx<String?> passwordErrorText = Rx<String?>(null);
  Rx<String?> passwordConfirmationErrorText = Rx<String?>(null);
  Rx<bool> isFormValid = Rx<bool>(false);
  Rx<bool> obscurePasswordText = true.obs;
  Rx<bool> obscurePasswordConfimationText = true.obs;
  Rx<bool> isLoading = Rx<bool>(false);
  Rx<GenericResponseModel?> responseData = Rx<GenericResponseModel?>(null);
  Rx<String?> errorMessage = Rx<String?>(null);
  Rx<String?> email = Rx<String?>(null);
  Rx<String?> otp = Rx<String?>(null);

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmationController =
      TextEditingController();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _passwordConfirmationFocusNode = FocusNode();

  TextEditingController get passwordController => _passwordController;
  TextEditingController get passwordConfirmationController =>
      _passwordConfirmationController;
  FocusNode get passwordFocusNode => _passwordFocusNode;
  FocusNode get passwordConfirmationFocusNode => _passwordConfirmationFocusNode;

  @override
  void onInit() {
    _passwordFocusNode.addListener(() => update());
    _passwordConfirmationFocusNode.addListener(() => update());
    _passwordController.addListener(validateForm);
    _passwordConfirmationController.addListener(validateForm);
    super.onInit();
  }

  void postResetPassword() async {
    isLoading.value = true;
    try {
      final String? token = await SharedPreferencesManager.getToken();
      final String? email =
          await SharedPreferencesManager.getForgotPasswordEmail();
      final String? otp = await SharedPreferencesManager.getOtpNumber();

      final result = await _apiService.postResetPassword(
        email,
        otp,
        _passwordController.text,
        _passwordConfirmationController.text,
        token,
      );
      responseData.value = result;
      SharedPreferencesManager.removeForgotPasswordEmail();
      SharedPreferencesManager.removeOtpNumber();
      Get.offNamed(AppRoutes.newPassword);
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

  void validatePassword(String value) {
    if (value.length < 8) {
      passwordErrorText.value = 'Kata sandi minimal 8 karakter';
    } else {
      passwordErrorText.value = null;
    }
    validateForm();
  }

  void validatePasswordConfirmation(String value) {
    if (value != _passwordController.text) {
      passwordConfirmationErrorText.value = 'Kata sandi tidak cocok';
    } else {
      passwordConfirmationErrorText.value = null;
    }
    validateForm();
  }

  void validateForm() {
    if (passwordErrorText.value != null ||
        passwordConfirmationErrorText.value != null ||
        _passwordController.text == '' ||
        _passwordConfirmationController.text == '') {
      isFormValid.value = false;
    } else {
      isFormValid.value = true;
    }
  }

  void toggleObscurePasswordText() {
    obscurePasswordText.value = !obscurePasswordText.value;
  }

  void toggleObscurePasswordConfirmationText() {
    obscurePasswordConfimationText.value =
        !obscurePasswordConfimationText.value;
  }
}
