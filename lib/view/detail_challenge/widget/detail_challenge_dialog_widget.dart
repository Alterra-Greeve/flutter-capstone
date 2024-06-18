import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/images_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';

import '../../../global_widgets/global_button_widget.dart';

void showUpdateChallengeSuccessDialog() {
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
                textAlign: TextAlign.center,
                'Yeay, bukti tantangan sudah dikirim. Yuk selesaikan tantangan lainnya!',
                style: TextStylesConstant.nunitoCaption,
              ),
              const SizedBox(height: 8),
            ],
          ),
          actions: [
            GlobalButtonWidget(
              text: 'Oke',
              buttonColor: ColorsConstant.primary500,
              textColor: ColorsConstant.neutral100,
              onTap: () {
                Get.back();
              },
            ),
          ],
        ),
      );
}