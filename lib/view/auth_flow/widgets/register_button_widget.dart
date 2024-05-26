part of '../screens/register/register_screen.dart';

class RegisterButtonWidget extends StatelessWidget {
  final RegisterController controller = Get.put(RegisterController());

  RegisterButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GlobalButtonWidget(
        text: 'Daftar',
        isFormValid: controller.isFormValid.value,
        onTap: () {
          controller.clearForm();
          Get.to(
            const RegisterSuccessScreen(),
          );
        },
      ),
    );
  }
}
