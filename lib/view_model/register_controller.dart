part of '../view/register/screens/register_screen.dart';

class RegisterController extends GetxController {
  final ApiAuthService _apiService = ApiAuthService();

  Rx<String?> nameErrorText = Rx<String?>(null);
  Rx<String?> emailErrorText = Rx<String?>(null);
  Rx<String?> passwordErrorText = Rx<String?>(null);
  Rx<String?> passwordConfirmationErrorText = Rx<String?>(null);
  Rx<bool> isFormValid = Rx<bool>(false);
  Rx<bool> obscurePasswordText = true.obs;
  Rx<bool> obscurePasswordConfimationText = true.obs;
  Rx<bool> isLoading = Rx<bool>(false);
  Rx<GenericResponseModel?> registerData = Rx<GenericResponseModel?>(null);
  Rx<String?> errorMessage = Rx<String?>(null);

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmationController =
      TextEditingController();
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _passwordConfirmationFocusNode = FocusNode();

  TextEditingController get nameController => _nameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get passwordConfirmationController =>
      _passwordConfirmationController;
  FocusNode get nameFocusNode => _nameFocusNode;
  FocusNode get emailFocusNode => _emailFocusNode;
  FocusNode get passwordFocusNode => _passwordFocusNode;
  FocusNode get passwordConfirmationFocusNode => _passwordConfirmationFocusNode;

  @override
  void onInit() {
    _emailFocusNode.addListener(() => update());
    _passwordFocusNode.addListener(() => update());
    _nameController.addListener(validateForm);
    _emailController.addListener(validateForm);
    _passwordController.addListener(validateForm);
    _passwordConfirmationController.addListener(validateForm);
    super.onInit();
  }

  void postRegister() async {
    isLoading.value = true;
    try {
      final result = await _apiService.postRegister(_nameController.text,
          _emailController.text, _passwordController.text);
      registerData.value = result;
      if (result.status == true) {
        Get.offAllNamed(AppRoutes.registerSuccess);
      }
    } catch (e) {
      errorMessage.value = e.toString();
      showRegisterFailedDialog(errorMessage.value ?? '');
    } finally {
      isLoading.value = false;
      clearForm();
    }
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
    if (value != _passwordController.text) {
      passwordConfirmationErrorText.value = 'Kata sandi tidak cocok';
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
        _nameController.text == '' ||
        _emailController.text == '' ||
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

  void clearForm() {
    _nameController.clear();
    _emailController.clear();
    _passwordController.clear();
    _passwordConfirmationController.clear();
    nameErrorText.value = null;
    emailErrorText.value = null;
    passwordErrorText.value = null;
    passwordConfirmationErrorText.value = null;
    isFormValid.value = false;
  }

  void showRegisterFailedDialog(String errorMessage) {
    Get.defaultDialog(
      backgroundColor: ColorsConstant.white,
      title: 'Gagal Daftar!',
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
              'Daftar Kembali',
              style: TextStylesConstant.nunitoButtonLarge
                  .copyWith(color: ColorsConstant.primary500),
            ),
          ),
        ),
      ),
    );
  }
}
