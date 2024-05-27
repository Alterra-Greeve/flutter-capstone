part of '../screens/register/register_screen.dart';

class RegisterFormPasswordWidget extends StatelessWidget {
  final RegisterController _controller = Get.put(RegisterController());

  RegisterFormPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GlobalTextFieldWidget(
        focusNode: _controller.passwordFocusNode,
        controller: _controller.passwordController,
        errorText: _controller.passwordErrorText.value,
        hintText: 'Masukkan Kata Sandi Anda',
        prefixIcon: IconsConstant.lock,
        showSuffixIcon: true,
        onChanged: (value) => _controller.validatePassword(
          value,
        ),
        obscureText: _controller.obscurePasswordConfimationText.value,
        onPressedSuffixIcon: () => _controller.toggleObscurePasswordConfirmationText(),
      ),
    );
  }
}
