part of '../screens/register/register_screen.dart';

class RegisterButtonWidget extends StatelessWidget {
  final RegisterController _controller = Get.put(RegisterController());

  RegisterButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GlobalButtonWidget(
        text: 'Daftar',
        isFormValid: _controller.isFormValid.value,
        onTap: () {
          Get.toNamed(RoutesConstant.registerSuccess);
        },
      ),
    );
  }
}
