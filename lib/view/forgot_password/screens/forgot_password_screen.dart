import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:greeve/global_widgets/global_form_button_widget.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/images_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/global_widgets/global_text_field_widget.dart';
import 'package:greeve/view_model/forgot_password_controller.dart';

class ForgotPassScreen extends StatelessWidget {
  const ForgotPassScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ForgotPasswordController controller =
        Get.put(ForgotPasswordController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
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
        body: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Form(
            child: Container(
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 60),
              child: Column(
                children: [
                  SvgPicture.asset(
                    ImagesConstant.forgotPass,
                    height: 240.0,
                    width: 240.0,
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Lupa Kata Sandi",
                      style: TextStylesConstant.nunitoHeading3,
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Masukkan email Anda, kami akan kirim tautan untuk atur ulang kata sandi.",
                      style: TextStylesConstant.nunitoSubtitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 28),
                  SizedBox(
                    width: double.infinity,
                    height: 20,
                    child: Text(
                      'Email',
                      style: TextStylesConstant.nunitoCaption.copyWith(
                        fontWeight: FontWeight.w700,
                        color: ColorsConstant.neutral800,
                      ),
                    ),
                  ),
                  Obx(
                    () => GlobalTextFieldWidget(
                      focusNode: controller.emailFocusNode,
                      controller: controller.emailController,
                      errorText: controller.emailErrorText.value,
                      hintText: 'Masukkan Email Anda',
                      prefixIcon: IconsConstant.message,
                      showSuffixIcon: false,
                      onChanged: (value) => controller.validateEmail(value),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  const SizedBox(height: 27),
                  Obx(
                    () => GlobalFormButtonWidget(
                      text: 'Kirim Tautan',
                      isFormValid: controller.isFormValid.value,
                      onTap: () {
                        controller.postForgotPassword();
                      },
                      isLoading: controller.isLoading.value,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
