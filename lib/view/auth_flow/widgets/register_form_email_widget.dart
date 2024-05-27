part of '../screens/register/register_screen.dart';

class RegisterFormEmailWidget extends StatelessWidget {
  final RegisterController _controller = Get.put(RegisterController());

  RegisterFormEmailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GlobalTextFieldWidget(
        focusNode: _controller.emailFocusNode,
        controller: _controller.emailController,
        errorText: _controller.emailErrorText.value,
        hintText: 'Masukkan Email Anda',
        prefixIcon: IconsConstant.message,
        showSuffixIcon: false,
        onChanged: (value) => _controller.validateEmail(
          value,
        ),
      ),
    );
  }
}
