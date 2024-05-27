part of '../screens/register_screen.dart';


class RegisterFormEmailWidget extends StatelessWidget {
  const RegisterFormEmailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterController controller = Get.put(RegisterController());
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
