import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greeve/models/api_responses/generic_response_model.dart';
import 'package:greeve/routes/app_routes.dart';
import 'package:greeve/services/api/api_auth_service.dart';
import 'package:greeve/services/shared_pref/shared_pref.dart';

class OtpController extends GetxController {
  final ApiAuthService _apiService = ApiAuthService();

  Rx<bool> isFormValid = Rx<bool>(false);
  Rx<bool> isLoading = Rx<bool>(false);
  Rx<GenericResponseModel?> responseData = Rx<GenericResponseModel?>(null);
  Rx<String?> errorMessage = Rx<String?>(null);
  Rx<String?> email = Rx<String?>(null);
  var isResendClickable = true.obs;
  var countdown = 0.obs;
  var resendAttempts = 0;
  Timer? _timer;

  final TextEditingController _otpController = TextEditingController();
  TextEditingController get otpController => _otpController;

  @override
  void onInit() {
    _otpController.addListener(validateOtp);
    super.onInit();
    _loadEmail();
  }

  void _loadEmail() async {
    email.value = await SharedPreferencesManager.getForgotPasswordEmail();
  }

  void postOtp() async {
    isLoading.value = true;
    try {
      final String? token = await SharedPreferencesManager.getToken();

      final result = await _apiService.postOtp(
        email.value,
        _otpController.text,
        token,
      );
      responseData.value = result;
      SharedPreferencesManager.saveOtpNumber(
          otp: _otpController.text);
      Get.offNamed(AppRoutes.confirmPassword);
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

  void validateOtp() {
    if (_otpController.text.length != 6) {
      isFormValid.value = false;
    } else {
      isFormValid.value = true;
    }
  }

  void startResendCountdown() {
    if (_timer != null) {
      _timer!.cancel();
    }

    resendAttempts += 1;
    countdown.value = 30 + (resendAttempts - 1) * 10;
    isResendClickable.value = false;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countdown.value > 0) {
        countdown.value -= 1;
      } else {
        _timer!.cancel();
        isResendClickable.value = true;
      }
    });
  }

  String getFormattedCountdown() {
    int minutes = countdown.value ~/ 60;
    int seconds = countdown.value % 60;
    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }

  void resendOtp() async {
    final String? token = await SharedPreferencesManager.getToken();
    final String? email =
        await SharedPreferencesManager.getForgotPasswordEmail();

    _apiService.postForgotPassword(email, token);
  }

  @override
  void onClose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    super.onClose();
  }
}
