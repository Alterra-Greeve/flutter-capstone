import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:greeve/global_widgets/global_form_button_widget.dart';
import 'package:greeve/global_widgets/global_text_field_widget.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/images_constant.dart';
import 'package:greeve/utils/constants/routes_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view_model/login_controller.dart';
import 'package:loading_indicator/loading_indicator.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 56, bottom: 40),
                    child: Center(
                        child: SvgPicture.asset(ImagesConstant.logoPotrait)),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Masuk',
                          style: TextStylesConstant.nunitoHeading4,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Masuk ke akun Anda sekarang',
                          style: TextStylesConstant.nunitoSubtitle,
                        ),
                        const SizedBox(height: 28),
                        SizedBox(
                          height: 20,
                          child: Text(
                            'Email',
                            style: TextStylesConstant.nunitoCaption.copyWith(
                              color: ColorsConstant.neutral800,
                            ),
                          ),
                        ),
                        Obx(() => GlobalTextFieldWidget(
                              focusNode: controller.emailFocusNode,
                              controller: controller.emailController,
                              errorText: controller.emailErrorText.value,
                              hintText: 'Masukkan Email Anda',
                              prefixIcon: IconsConstant.message,
                              showSuffixIcon: false,
                              onChanged: (value) =>
                                  controller.validateEmail(value),
                              helperText: 'Contoh : johndoe123@gmail.com',
                            )),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 20,
                          child: Text(
                            'Kata Sandi',
                            style: TextStylesConstant.nunitoCaption.copyWith(
                              color: ColorsConstant.neutral800,
                            ),
                          ),
                        ),
                        Obx(
                          () => GlobalTextFieldWidget(
                            focusNode: controller.passwordFocusNode,
                            controller: controller.passwordController,
                            errorText: controller.passwordErrorText.value,
                            hintText: 'Masukkan Kata Sandi Anda',
                            prefixIcon: IconsConstant.lock,
                            showSuffixIcon: true,
                            onChanged: (value) =>
                                controller.validatePassword(value),
                            obscureText: controller.obscureText.value,
                            onPressedSuffixIcon: () =>
                                controller.toggleObscureText(),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Obx(() => Checkbox(
                                      value: controller.remindMe.value,
                                      onChanged: (bool? newValue) {
                                        controller.setRemindMe(newValue);
                                      },
                                      checkColor: ColorsConstant.white,
                                      activeColor: ColorsConstant.primary500,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(4),
                                        ),
                                      ),
                                      side: const BorderSide(
                                        color: ColorsConstant.primary500,
                                        width: 2,
                                      ),
                                    )),
                                Text(
                                  'Ingatkan Saya',
                                  style: TextStylesConstant.nunitoCaption,
                                ),
                              ],
                            ),
                            TextButton(
                              onPressed: () {
                                Get.toNamed(RoutesConstant.forgotPassword);
                              },
                              child: Text(
                                'Lupa Kata Sandi',
                                style: TextStylesConstant.nunitoButtonLarge
                                    .copyWith(
                                  color: ColorsConstant.primary500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                        Obx(
                          () => GlobalFormButtonWidget(
                            text: 'Masuk',
                            isFormValid: controller.isFormValid.value,
                            onTap: () {
                              controller.login();
                            },
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Belum Punya Akun?',
                                style: TextStylesConstant.nunitoSubtitle,
                              ),
                              TextButton(
                                style: ButtonStyle(
                                  padding: WidgetStateProperty.all<
                                      EdgeInsetsGeometry>(
                                    const EdgeInsets.symmetric(
                                      vertical: 2,
                                      horizontal: 4,
                                    ),
                                  ),
                                  minimumSize: WidgetStateProperty.all<Size>(
                                    const Size(41, 24),
                                  ),
                                ),
                                onPressed: () {
                                  Get.toNamed(RoutesConstant.register);
                                },
                                child: Text(
                                  'Daftar',
                                  style: TextStylesConstant.nunitoSubtitle
                                      .copyWith(
                                    color: ColorsConstant.primary500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Obx(
              () => controller.isLoading.value
                  ? const Center(
                      child: SizedBox(
                        width: 50,
                        child: LoadingIndicator(
                          indicatorType: Indicator.ballBeat,
                          strokeWidth: 4.0,
                          pathBackgroundColor: ColorsConstant.black,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
