import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greeve/global_widgets/global_form_button_widget.dart';
import 'package:greeve/utils/constants/images_constant.dart';
import 'package:greeve/routes/app_routes.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';

class RegisterSuccessScreen extends StatelessWidget {
  const RegisterSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                ImagesConstant.registerSuccessImage,
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                'Pendaftaran Berhasil',
                style: TextStylesConstant.nunitoHeading3,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Selamat, akun Anda telah berhasil dibuat. Anda sekarang dapat masuk dan mulai menggunakan semua fitur yang tersedia.',
                style: TextStylesConstant.nunitoSubtitle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 40,
              ),
              GlobalFormButtonWidget(
                text: 'Masuk Sekarang',
                onTap: () {
                  Get.offAllNamed(AppRoutes.login);
                },
                isFormValid: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
