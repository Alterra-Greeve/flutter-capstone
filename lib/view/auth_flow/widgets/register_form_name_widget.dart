part of '../screens/register/register_screen.dart';

class RegisterFormNameWidget extends StatelessWidget {
  final RegisterController _controller = Get.put(RegisterController());

  RegisterFormNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GlobalTextFieldWidget(
        focusNode: _controller.nameFocusNode,
        controller: _controller.nameController,
        errorText: _controller.nameErrorText.value,
        hintText: 'Masukkan Nama Lengkap Anda',
        showSuffixIcon: false,
        onChanged: (value) => _controller.validateName(
          value,
        ),
      ),
    );
  }
}
