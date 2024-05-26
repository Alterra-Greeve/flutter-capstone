import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  Rx<String?> emailErrorText = Rx<String?>(null);
  Rx<String?> passwordErrorText = Rx<String?>(null);
  Rx<bool> isFormValid = Rx<bool>(false);
  Rx<bool?> remindMe = Rx<bool?>(false);
  Rx<bool> obscureText = true.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  @override
  void onInit() {
    emailFocusNode.addListener(() => update());
    passwordFocusNode.addListener(() => update());
    emailController.addListener(validateForm);
    passwordController.addListener(validateForm);
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
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
  }

  void validatePassword(String value) {
    if (value.length < 8) {
      passwordErrorText.value = 'Kata sandi minimal 8 karakter';
    } else {
      passwordErrorText.value = null;
    }
  }

  void validateForm() {
    if (emailErrorText.value != null ||
        passwordErrorText.value != null ||
        emailController.text == '' ||
        passwordController.text == '') {
      isFormValid.value = false;
    } else {
      isFormValid.value = true;
    }
  }

  void setRemindMe(bool? newValue) {
    remindMe.value = newValue;
  }

  void toggleObscureText() {
    obscureText.value = !obscureText.value;
  }
}
