import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:greeve/global_widgets/global_button_widget.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/images_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view_model/bottom_navigation_controller.dart';
import 'package:greeve/view_model/user_profile_controller.dart';

void showSaveConfirmationDialog(UserProfileController controller) {
  Get.dialog(
    AlertDialog(
      backgroundColor: ColorsConstant.neutral100,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(ImagesConstant.saveUser),
          const SizedBox(height: 20),
          Text(
            'Simpan Data',
            style: TextStylesConstant.nunitoHeading3,
          ),
          const SizedBox(height: 20),
          Text(
            'Yakin ingin menyimpan data ini?',
            style: TextStylesConstant.nunitoCaption,
          ),
          const SizedBox(height: 8),
        ],
      ),
      actions: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: GlobalButtonWidget(
                text: 'Batal',
                buttonColor: ColorsConstant.neutral100,
                textColor: ColorsConstant.primary500,
                onTap: () {
                  Get.back();
                },
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: GlobalButtonWidget(
                text: 'Simpan',
                buttonColor: ColorsConstant.primary500,
                textColor: ColorsConstant.neutral100,
                onTap: () {
                  controller.updateUserProfile();
                  Get.back();
                },
              ),
            ),
          ],
        )
      ],
    ),
  );
}

void showSaveSuccessDialog() {
  Get.dialog(
    AlertDialog(
      backgroundColor: ColorsConstant.neutral100,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(ImagesConstant.saveUserSuccess),
          const SizedBox(height: 20),
          Text(
            'Berhasil',
            style: TextStylesConstant.nunitoHeading3,
          ),
          const SizedBox(height: 20),
          Text(
            'Yeay, datamu sudah berhasil disimpan',
            style: TextStylesConstant.nunitoCaption,
          ),
          const SizedBox(height: 8),
        ],
      ),
      actions: [
        Expanded(
          child: GlobalButtonWidget(
            text: 'Oke',
            buttonColor: ColorsConstant.primary500,
            textColor: ColorsConstant.neutral100,
            onTap: () {
              Get.back();
            },
          ),
        ),
      ],
    ),
  );
}

void showSaveFailedDialog(String errorMessage) {
  Get.dialog(
    AlertDialog(
      backgroundColor: ColorsConstant.neutral100,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(ImagesConstant.throwChallengeLimit),
          const SizedBox(height: 20),
          Text(
            'Gagal Menyimpan',
            style: TextStylesConstant.nunitoHeading3,
          ),
          const SizedBox(height: 20),
          Text(
            errorMessage,
            style: TextStylesConstant.nunitoCaption,
          ),
          const SizedBox(height: 8),
        ],
      ),
      actions: [
        Expanded(
          child: GlobalButtonWidget(
            text: 'Oke',
            buttonColor: ColorsConstant.primary500,
            textColor: ColorsConstant.neutral100,
            onTap: () {
              Get.back();
            },
          ),
        ),
      ],
    ),
  );
}

void showLogoutConfirmationDialog(BottomNavController controller) {
  Get.dialog(
    AlertDialog(
      backgroundColor: ColorsConstant.neutral100,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Anda yakin ingin keluar?',
            style: TextStylesConstant.nunitoHeading3,
          ),
          const SizedBox(height: 8),
        ],
      ),
      actions: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: GlobalButtonWidget(
                text: 'Batal',
                buttonColor: ColorsConstant.neutral100,
                textColor: ColorsConstant.primary500,
                onTap: () {
                  Get.back();
                },
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: GlobalButtonWidget(
                text: 'Keluar',
                buttonColor: ColorsConstant.primary500,
                textColor: ColorsConstant.neutral100,
                onTap: () {
                  controller.logout();
                  Get.back();
                },
              ),
            ),
          ],
        )
      ],
    ),
  );
}
