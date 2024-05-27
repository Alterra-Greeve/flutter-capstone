import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  Rx<bool> isFormValid = Rx<bool>(false);
  Rx<String?> emailErrorText = Rx<String?>(null);
  Rx<bool?> remindMe = Rx<bool?>(false);

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

  @override
  void onClose() {
    _emailController.dispose();
    _emailFocusNode.dispose();
    super.onClose();
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
