import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/routes/app_routes.dart';
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
          leading: Padding(
            padding: const EdgeInsets.only(top: 24),
            child: IconButton(
              icon: SvgPicture.asset(
                IconsConstant.arrow,
                colorFilter: const ColorFilter.mode(
                  ColorsConstant.black,
                  BlendMode.srcIn,
                ),
              ),
              iconSize: 24,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 36,
          ),
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
              Text(
                "budi123@gmail.com",
                style: TextStylesConstant.nunitoSubtitle.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
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
                      Padding(
                        padding: const EdgeInsets.only(bottom: 1),
                        child: Text("Tidak Menerima Kode?",
                            style:
                                TextStylesConstant.nunitoButtonLarge.copyWith(
                              color: ColorsConstant.black,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          "Kirim Ulang",
                          style: TextStylesConstant.nunitoButtonLarge.copyWith(
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
              Obx(() => GlobalFormButtonWidget(
                    text: 'Konfirmasi',
                    isFormValid: controller.isFormValid.value,
                    onTap: () {
                      Get.offAndToNamed(AppRoutes.confirmPassword);
                    },
                  )),
            ],
          ),
        ),
      ),
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: PinCodeTextField(
        appContext: context,
        length: 4,
        keyboardType: TextInputType.number,
        controller: controller,
        enableActiveFill: true,
        animationType: AnimationType.fade,
        animationDuration: const Duration(milliseconds: 300),
        onChanged: onChanged,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(8),
          fieldHeight: 76,
          fieldWidth: 73,
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
