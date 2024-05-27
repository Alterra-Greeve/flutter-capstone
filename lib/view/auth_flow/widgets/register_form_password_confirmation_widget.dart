part of '../screens/register/register_screen.dart';

class RegisterFormPasswordConfirmationWidget extends StatelessWidget {
  final RegisterController controller = Get.put(RegisterController());

  RegisterFormPasswordConfirmationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GlobalTextFieldWidget(
        focusNode: controller.passwordConfirmationFocusNode,
        controller: controller.passwordConfirmationController,
        errorText: controller.passwordConfirmationErrorText.value,
        hintText: 'Masukkan Kata Sandi Anda',
        prefixIcon: IconsConstant.lock,
        showSuffixIcon: true,
        onChanged: (value) => controller.validatePasswordConfirmation(
          value,
        ),
        obscureText: controller.obscurePasswordText.value,
        onPressedSuffixIcon: () => controller.toggleObscurePasswordText(),
        helperText: 'Masukkan kembali kata sandi yang sama',
      ),
    );
  }
}
