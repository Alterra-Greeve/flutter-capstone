part of '../screens/register/register_screen.dart';

class RegisterFormPasswordWidget extends StatelessWidget {
  final RegisterController controller = Get.put(RegisterController());

  RegisterFormPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GlobalTextFieldWidget(
        focusNode: controller.passwordFocusNode,
        controller: controller.passwordController,
        errorText: controller.passwordErrorText.value,
        hintText: 'Masukkan Kata Sandi Anda',
        prefixIcon: IconsConstant.lock,
        showSuffixIcon: true,
        onChanged: (value) => controller.validatePassword(
          value,
        ),
        obscureText: controller.obscurePasswordConfimationText.value,
        onPressedSuffixIcon: () => controller.toggleObscurePasswordConfirmationText(),
      ),
    );
  }
}
