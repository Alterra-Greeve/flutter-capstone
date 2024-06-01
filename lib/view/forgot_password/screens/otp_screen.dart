import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/view_model/otp_controller.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:greeve/global_widgets/global_form_button_widget.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final OtpController controller = Get.put(OtpController());
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            scrolledUnderElevation: 0,
            toolbarHeight: 64,
            leading: IconButton(
              icon: SvgPicture.asset(
                IconsConstant.arrow,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Container(
            width: double.maxFinite,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Verifikasi Kode OTP",
                  style: TextStylesConstant.nunitoHeading3,
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  "Masukkan kode OTP yang telah kami kirim ke",
                  style: TextStylesConstant.nunitoSubtitle,
                ),
                const SizedBox(
                  height: 3,
                ),
                Obx(() => Text(
                      controller.email.value ?? '',
                      style: TextStylesConstant.nunitoSubtitle.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                const SizedBox(
                  height: 26,
                ),
                CustomPinCodeTextField(
                  controller: controller.otpController,
                  onChanged: (String value) {},
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Obx(
                          () => controller.isResendClickable.value
                              ? Padding(
                                  padding: const EdgeInsets.only(bottom: 1),
                                  child: Text(
                                    "Tidak Menerima Kode? ",
                                    style: TextStylesConstant.nunitoButtonLarge
                                        .copyWith(
                                      color: ColorsConstant.black,
                                    ),
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(bottom: 1),
                                  child: Text(
                                    "Kirim ulang kode ",
                                    style: TextStylesConstant.nunitoButtonLarge
                                        .copyWith(
                                      color: ColorsConstant.black,
                                    ),
                                  ),
                                ),
                        ),
                        Obx(
                          () => controller.isResendClickable.value
                              ? GestureDetector(
                                  onTap: () {
                                    controller.resendOtp();
                                    controller.startResendCountdown();
                                  },
                                  child: Text(
                                    "Kirim ulang",
                                    style: TextStylesConstant.nunitoButtonLarge
                                        .copyWith(
                                      color: ColorsConstant.primary500,
                                    ),
                                  ),
                                )
                              : Text(
                                  controller.getFormattedCountdown(),
                                  style: TextStylesConstant.nunitoButtonLarge
                                      .copyWith(
                                    color: ColorsConstant.primary500,
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 36,
                ),
                Obx(
                  () => GlobalFormButtonWidget(
                    text: 'Konfirmasi',
                    isFormValid: controller.isFormValid.value,
                    onTap: () {
                      controller.postOtp();
                    },
                    isLoading: controller.isLoading.value,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

class CustomPinCodeTextField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController? controller;

  const CustomPinCodeTextField({
    Key? key,
    required this.controller,
    required this.onChanged,
    final Duration? animationDuration,
    final BuildContext? appContext,
    final int? length,
    final TextInputType? keyboardType,
    final bool? enableActiveFill,
    final AnimationType? animationType,
    final PinTheme? pinTheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fieldWidth = (screenWidth - 32) / 6 - 8;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: PinCodeTextField(
        appContext: context,
        length: 6,
        keyboardType: TextInputType.number,
        controller: controller,
        enableActiveFill: true,
        animationType: AnimationType.fade,
        animationDuration: const Duration(milliseconds: 300),
        onChanged: onChanged,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(8),
          fieldHeight: 50,
          fieldWidth: fieldWidth,
          selectedColor: ColorsConstant.primary500,
          selectedFillColor: ColorsConstant.white,
          inactiveColor: ColorsConstant.neutral400,
          activeColor: ColorsConstant.primary500,
          activeFillColor: ColorsConstant.white,
          inactiveFillColor: ColorsConstant.neutral200,
        ),
      ),
    );
  }
}
