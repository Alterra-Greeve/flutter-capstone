part of '../screens/register/register_screen.dart';

class RegisterFormNameWidget extends StatelessWidget {
  final RegisterController controller = Get.put(RegisterController());

  RegisterFormNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GlobalTextFieldWidget(
        focusNode: controller.nameFocusNode,
        controller: controller.nameController,
        errorText: controller.nameErrorText.value,
        hintText: 'Masukkan Nama Lengkap Anda',
        showSuffixIcon: false,
        onChanged: (value) => controller.validateName(
          value,
        ),
      ),
    );
  }
}
