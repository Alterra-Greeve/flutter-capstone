part of '../screens/register_screen.dart';

class RegisterButtonWidget extends StatelessWidget {
  const RegisterButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterController controller = Get.put(RegisterController());
    return Obx(
      () => GlobalFormButtonWidget(
        text: 'Daftar',
        isFormValid: controller.isFormValid.value,
        onTap: () {
          controller.postRegister();
        },
      ),
    );
  }
}
