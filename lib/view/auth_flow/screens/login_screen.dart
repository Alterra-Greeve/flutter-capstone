import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:greeve/global_widgets/global_text_field_widget.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/images_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FocusNode _focusNode = FocusNode();
  final _controller = TextEditingController();
  String? _errorText;
  bool remindMe = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                    GlobalTextFieldWidget(
                      focusNode: _focusNode,
                      controller: _controller,
                      errorText: _errorText,
                      hintText: 'Masukkan Email Anda',
                      prefixIcon: IconsConstant.message,
                      showSuffixIcon: false,
                    ),
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
                    GlobalTextFieldWidget(
                      focusNode: _focusNode,
                      controller: _controller,
                      errorText: _errorText,
                      hintText: 'Masukkan Kata Sandi Anda',
                      prefixIcon: IconsConstant.lock,
                      showSuffixIcon: true,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Checkbox(
                              value: remindMe,
                              onChanged: (bool? newValue) {
                                setState(() {
                                  remindMe = newValue!;
                                });
                              },
                            ),
                            Text(
                              'Ingatkan Saya',
                              style: TextStylesConstant.nunitoCaption,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
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
                    InkWell(
                      onTap: () {
                        Get.defaultDialog(
                          title: "This is a Simple Dialog",
                          middleText: "This is the content of the dialog",
                          textConfirm: "OK",
                          confirmTextColor: Colors.white,
                          onConfirm: () {
                            Get.back();
                          },
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 48,
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: ColorsConstant.neutral200,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text(
                          'Masuk',
                          style: TextStylesConstant.nunitoButtonLarge.copyWith(
                            color: ColorsConstant.neutral500,
                          ),
                          textAlign: TextAlign.center,
                        ),
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
                          const SizedBox(width: 6),
                          Text(
                            'Daftar',
                            style: TextStylesConstant.nunitoSubtitle.copyWith(
                              color: ColorsConstant.primary500,
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
