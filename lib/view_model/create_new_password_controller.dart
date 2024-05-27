import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewPasswordController extends GetxController {
  Rx<String?> passwordErrorText = Rx<String?>(null);
  Rx<String?> passwordConfirmationErrorText = Rx<String?>(null);
  Rx<bool> isFormValid = Rx<bool>(false);
  Rx<bool> obscurePasswordText = true.obs;
  Rx<bool> obscurePasswordConfimationText = true.obs;

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
    obscurePasswordConfimationText.value = !obscurePasswordConfimationText.value;
  }
}
