part of '../screens/register/register_screen.dart';

class RegisterFormEmailWidget extends StatelessWidget {
  final RegisterController controller = Get.put(RegisterController());

  RegisterFormEmailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GlobalTextFieldWidget(
        focusNode: controller.emailFocusNode,
        controller: controller.emailController,
        errorText: controller.emailErrorText.value,
        hintText: 'Masukkan Email Anda',
        prefixIcon: IconsConstant.message,
        showSuffixIcon: false,
        onChanged: (value) => controller.validateEmail(
          value,
        ),
      ),
    );
  }
}
