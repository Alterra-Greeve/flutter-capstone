import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  Rx<bool> isFormValid = Rx<bool>(false);

  final TextEditingController _otpController = TextEditingController();
  TextEditingController get otpController => _otpController;

  @override
  void onInit() {
    _otpController.addListener(validateOtp);
    super.onInit();
  }

  void validateOtp() {
    if (_otpController.text.length != 4) {
      isFormValid.value = false;
    } else {
      isFormValid.value = true;
    }
  }

  void clearForm() {
    _otpController.clear();
    isFormValid.value = false;
  }
}
