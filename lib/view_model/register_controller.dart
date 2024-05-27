part of '../view/auth_flow/screens/register/register_screen.dart';

class RegisterController extends GetxController {
  Rx<String?> nameErrorText = Rx<String?>(null);
  Rx<String?> emailErrorText = Rx<String?>(null);
  Rx<String?> passwordErrorText = Rx<String?>(null);
  Rx<String?> passwordConfirmationErrorText = Rx<String?>(null);
  Rx<bool> isFormValid = Rx<bool>(false);
  Rx<bool> obscurePasswordText = true.obs;
  Rx<bool> obscurePasswordConfimationText = true.obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  final FocusNode nameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode passwordConfirmationFocusNode = FocusNode();

  @override
  void onInit() {
    emailFocusNode.addListener(() => update());
    passwordFocusNode.addListener(() => update());
    nameController.addListener(validateForm);
    emailController.addListener(validateForm);
    passwordController.addListener(validateForm);
    passwordConfirmationController.addListener(validateForm);
    super.onInit();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmationController.dispose();
    nameFocusNode.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    passwordConfirmationFocusNode.dispose();
    super.onClose();
  }

  void validateName(String value) {
    if (value.isEmpty) {
      nameErrorText.value = 'Nama tidak boleh kosong';
    } else {
      nameErrorText.value = null;
    }
    validateForm();
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

  void validatePasswordConfirmation(String value) {
    if (value != passwordController.text) {
      passwordConfirmationErrorText.value = 'Kata sandi tidak sama';
    } else {
      passwordConfirmationErrorText.value = null;
    }
    validateForm();
  }

  void validateForm() {
    if (nameErrorText.value != null ||
        emailErrorText.value != null ||
        passwordErrorText.value != null ||
        passwordConfirmationErrorText.value != null ||
        nameController.text == '' ||
        emailController.text == '' ||
        passwordController.text == '' ||
        passwordConfirmationController.text == '') {
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

  void clearForm() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    passwordConfirmationController.clear();
    nameErrorText.value = null;
    emailErrorText.value = null;
    passwordErrorText.value = null;
    passwordConfirmationErrorText.value = null;
    isFormValid.value = false;
  }
}
