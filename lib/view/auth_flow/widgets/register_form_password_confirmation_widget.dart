part of '../screens/register/register_screen.dart';

class RegisterFormPasswordConfirmationWidget extends StatelessWidget {
  final RegisterController _controller = Get.put(RegisterController());

  RegisterFormPasswordConfirmationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GlobalTextFieldWidget(
        focusNode: _controller.passwordConfirmationFocusNode,
        controller: _controller.passwordConfirmationController,
        errorText: _controller.passwordConfirmationErrorText.value,
        hintText: 'Masukkan Kata Sandi Anda',
        prefixIcon: IconsConstant.lock,
        showSuffixIcon: true,
        onChanged: (value) => _controller.validatePasswordConfirmation(
          value,
        ),
        obscureText: _controller.obscurePasswordText.value,
        onPressedSuffixIcon: () => _controller.toggleObscurePasswordText(),
        helperText: 'Masukkan kembali kata sandi yang sama',
      ),
    );
  }
}
