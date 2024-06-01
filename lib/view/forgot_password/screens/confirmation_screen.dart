import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greeve/global_widgets/global_form_button_widget.dart';
import 'package:greeve/global_widgets/global_text_field_widget.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/routes/app_routes.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view_model/create_new_password_controller.dart';

class ConfirmPassScreen extends StatelessWidget {
  const ConfirmPassScreen({super.key});

  void showConfirmationPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: ColorsConstant.neutral100,
          title: Text(
            'Hampir Selesai!',
            style: TextStylesConstant.nunitoHeading3.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          content: Text(
            'Tinggal selangkah lagi untuk menyelesaikan. Meninggalkan halaman ini akan menghapus semua perubahan yang belum disimpan.',
            style: TextStylesConstant.nunitoCaption.copyWith(
              color: ColorsConstant.neutral800,
            ),
            textAlign: TextAlign.center,
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () => Get.offNamed(AppRoutes.login),
                  child: Text(
                    'Keluar',
                    style: TextStylesConstant.nunitoButtonLarge.copyWith(
                      color: ColorsConstant.primary500,
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: ColorsConstant.primary500,
                    ),
                    child: Text(
                      'Tetap di sini',
                      style: TextStylesConstant.nunitoButtonLarge.copyWith(
                        color: ColorsConstant.neutral100,
                      ),
                    )),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final CreateNewPasswordController controller =
        Get.put(CreateNewPasswordController());
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
                showConfirmationPopup(context);
              },
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              width: double.maxFinite,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Buat Kata Sandi Baru",
                    style: TextStylesConstant.nunitoHeading3,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Masukkan kata sandi baru untuk akun Anda. \nPastikan kata sandi kuat dan mudah diingat.",
                    style: TextStylesConstant.nunitoSubtitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 28),
                  SizedBox(
                    height: 20,
                    child: Text(
                      'Kata Sandi Baru',
                      style: TextStylesConstant.nunitoCaption.copyWith(
                        fontWeight: FontWeight.w700,
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
                      onChanged: (value) => controller.validatePassword(value),
                      onPressedSuffixIcon: () =>
                          controller.toggleObscurePasswordText(),
                      obscureText: controller.obscurePasswordText.value,
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  const SizedBox(height: 36),
                  SizedBox(
                    height: 20,
                    child: Text(
                      'Konfirmasi Kata Sandi',
                      style: TextStylesConstant.nunitoCaption.copyWith(
                        fontWeight: FontWeight.w700,
                        color: ColorsConstant.neutral800,
                      ),
                    ),
                  ),
                  Obx(
                    () => GlobalTextFieldWidget(
                      focusNode: controller.passwordConfirmationFocusNode,
                      controller: controller.passwordConfirmationController,
                      errorText: controller.passwordConfirmationErrorText.value,
                      hintText: 'Konfirmasi Kata Sandi Anda',
                      prefixIcon: IconsConstant.lock,
                      showSuffixIcon: true,
                      helperText: 'Masukkan kembali kata sandi yang sama',
                      onChanged: (value) =>
                          controller.validatePasswordConfirmation(value),
                      onPressedSuffixIcon: () =>
                          controller.toggleObscurePasswordConfirmationText(),
                      obscureText:
                          controller.obscurePasswordConfimationText.value,
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  const SizedBox(height: 36),
                  Obx(
                    () => GlobalFormButtonWidget(
                      text: 'Simpan Kata Sandi',
                      isFormValid: controller.isFormValid.value,
                      onTap: () {
                        controller.postResetPassword();
                      },
                      isLoading: controller.isLoading.value,
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
