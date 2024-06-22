import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greeve/global_widgets/global_button_widget.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';

void showChallengeLimitDialog(String title, String description, String image) {
  Get.dialog(
    AlertDialog(
      backgroundColor: ColorsConstant.neutral100,
      content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(image),
              const SizedBox(height: 28),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStylesConstant.nunitoTitleBold.copyWith(
                  color: ColorsConstant.neutral800,
                ),
              ),
              const SizedBox(height: 4),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  textAlign: TextAlign.center,
                  description,
                  style: TextStylesConstant.nunitoCaption.copyWith(
                    color: ColorsConstant.neutral800,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(height: 28),
              Align(
                alignment: Alignment.centerRight,
                child: GlobalButtonWidget(
                  text: 'Oke',
                  onTap: () {
                    Get.back();
                  },
                  buttonWidth: double.infinity,
                ),
              ),
            ],
          ),
    ),
  );
}
