import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greeve/models/api_responses/login_response_model.dart';
import 'package:greeve/services/api/api_auth_service.dart';
import 'package:greeve/services/shared_pref/shared_pref.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/routes/app_routes.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';

class LoginController extends GetxController {
  final ApiAuthService _apiService = ApiAuthService();
  Rx<String?> emailErrorText = Rx<String?>(null);
  Rx<String?> passwordErrorText = Rx<String?>(null);
  Rx<bool> isFormValid = Rx<bool>(false);
  Rx<bool?> remindMe = Rx<bool?>(false);
  Rx<bool> obscureText = true.obs;
  Rx<bool> isLoading = Rx<bool>(false);
  Rx<LoginResponseModel?> loginData = Rx<LoginResponseModel?>(null);
  Rx<String?> errorMessage = Rx<String?>(null);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  FocusNode get emailFocusNode => _emailFocusNode;
  FocusNode get passwordFocusNode => _passwordFocusNode;

  @override
  void onInit() {
    _emailFocusNode.addListener(() => update());
    _passwordFocusNode.addListener(() => update());
    _emailController.addListener(validateForm);
    _passwordController.addListener(validateForm);
    super.onInit();
  }

  void postLogin() async {
    isLoading.value = true;
    try {
      final result = await _apiService.postLogin(
          _emailController.text, _passwordController.text);
      loginData.value = result;
      errorMessage.value = '';
      if (result.status == true && result.data != null) {
        SharedPreferencesManager.saveToken(token: result.data!.token!);
      }
      Get.offAllNamed(AppRoutes.loading);
    } catch (e) {
      errorMessage.value = e.toString();
      showLoginFailedDialog(errorMessage.value ?? '');
    } finally {
      isLoading.value = false;
      clearForm();
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

  void validatePassword(String value) {
    if (value.length < 8) {
      passwordErrorText.value = 'Kata sandi minimal 8 karakter';
    } else {
      passwordErrorText.value = null;
    }
    validateForm();
  }

  void validateForm() {
    if (emailErrorText.value != null ||
        passwordErrorText.value != null ||
        _emailController.text == '' ||
        _passwordController.text == '') {
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

  void clearForm() {
    _emailController.clear();
    _passwordController.clear();
    emailErrorText.value = null;
    passwordErrorText.value = null;
    isFormValid.value = false;
  }

  void showLoginFailedDialog(String errorMessage) {
    Get.defaultDialog(
      backgroundColor: ColorsConstant.white,
      title: 'Gagal Masuk!',
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
              'Masuk Kembali',
              style: TextStylesConstant.nunitoButtonLarge
                  .copyWith(color: ColorsConstant.primary500),
            ),
          ),
        ),
      ),
    );
  }
}
