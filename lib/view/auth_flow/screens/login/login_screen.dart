import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:greeve/global_widgets/global_button_widget.dart';
import 'package:greeve/global_widgets/global_text_field_widget.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/images_constant.dart';
import 'package:greeve/utils/constants/routes_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view_model/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController _controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 56, bottom: 40),
                child:
                    Center(child: SvgPicture.asset(ImagesConstant.logoPotrait)),
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
                          focusNode: _controller.emailFocusNode,
                          controller: _controller.emailController,
                          errorText: _controller.emailErrorText.value,
                          hintText: 'Masukkan Email Anda',
                          prefixIcon: IconsConstant.message,
                          showSuffixIcon: false,
                          onChanged: (value) => _controller.validateEmail(value),
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
                        focusNode: _controller.passwordFocusNode,
                        controller: _controller.passwordController,
                        errorText: _controller.passwordErrorText.value,
                        hintText: 'Masukkan Kata Sandi Anda',
                        prefixIcon: IconsConstant.lock,
                        showSuffixIcon: true,
                        onChanged: (value) =>
                            _controller.validatePassword(value),
                        obscureText: _controller.obscureText.value,
                        onPressedSuffixIcon: () =>
                            _controller.toggleObscureText(),
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
                                  value: _controller.remindMe.value,
                                  onChanged: (bool? newValue) {
                                    _controller.setRemindMe(newValue);
                                  },
                                  checkColor: ColorsConstant.white,
                                  activeColor: ColorsConstant.primary500,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(4),
                                    ),
                                  ),
                                  side: BorderSide(
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
                            style:
                                TextStylesConstant.nunitoButtonLarge.copyWith(
                              color: ColorsConstant.primary500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Obx(() => GlobalFormButtonWidget(
                          text: 'Masuk',
                          isFormValid: _controller.isFormValid.value,
                          onTap: () {
                            Get.defaultDialog(
                              title: 'Gagal Masuk!',
                              titleStyle:
                                  TextStylesConstant.nunitoHeading3.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 24),
                              content: Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 24,
                                  left: 24,
                                  right: 24,
                                ),
                                child: Text(
                                  "Email atau kata sandi yang Anda masukkan salah. Silakan periksa kembali informasi login Anda dan coba lagi.",
                                  textAlign: TextAlign.center,
                                  style: TextStylesConstant.nunitoSubtitle
                                      .copyWith(
                                    color: ColorsConstant.neutral600,
                                  ),
                                ),
                              ),
                              confirm: GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: Container(
                                  width: 250,
                                  height: 48,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: ColorsConstant.primary500,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Masuk Kembali',
                                      style: TextStylesConstant
                                          .nunitoButtonLarge
                                          .copyWith(
                                              color: ColorsConstant.primary500),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        )),
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
                              padding:
                                  MaterialStateProperty.all<EdgeInsetsGeometry>(
                                const EdgeInsets.symmetric(
                                  vertical: 2,
                                  horizontal: 4,
                                ),
                              ),
                              minimumSize: MaterialStateProperty.all<Size>(
                                const Size(41, 24),
                              ),
                            ),
                            onPressed: () {
                              Get.toNamed(RoutesConstant.register);
                            },
                            child: Text(
                              'Daftar',
                              style: TextStylesConstant.nunitoSubtitle.copyWith(
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
      ),
    );
  }
}
