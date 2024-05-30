part of '../screens/register_screen.dart';


class RegisterFormNameWidget extends StatelessWidget {

  const RegisterFormNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterController controller = Get.put(RegisterController());
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
