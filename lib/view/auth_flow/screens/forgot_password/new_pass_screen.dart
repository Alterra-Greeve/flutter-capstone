import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greeve/global_widgets/global_button_widget.dart';
import 'package:greeve/utils/constants/images_constant.dart';
import 'package:greeve/utils/constants/routes_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              SvgPicture.asset(
                ImagesConstant.success,
                height: 160,
                width: 240,
              ),
              const SizedBox(height: 24),
              Text(
                "Kata Sandi Berhasil Diperbarui!",
                style: TextStylesConstant.nunitoHeading3,
              ),
              const SizedBox(height: 8),
              Text(
                "Anda berhasil mengubah kata sandi. Silakan masuk.",
                style: TextStylesConstant.nunitoSubtitle,
              ),
              const SizedBox(height: 40),
              GlobalButtonWidget(
                text: 'Kembali ke Halaman Masuk',
                isFormValid: true,
                onTap: () {
                  Get.offAllNamed(RoutesConstant.login);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
