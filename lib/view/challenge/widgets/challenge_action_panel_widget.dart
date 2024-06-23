import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view_model/challenge_controller.dart';

class ChallengeActionPanelWidget extends StatelessWidget {
  final ChallengeController controller;
  const ChallengeActionPanelWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            controller.shuffleCards();
          },
          customBorder: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: Ink(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              color: ColorsConstant.primary500,
            ),
            width: 70,
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(IconsConstant.shuffle),
                const SizedBox(width: 4),
                Obx(
                  () => Text(
                    'x0${controller.remainingShuffle}',
                    style: TextStylesConstant.nunitoButtonLarge,
                  ),
                ),
              ],
            ),
          ),
        ),
        Row(
          children: [
            InkWell(
              onTap: () {},
              customBorder: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Ink(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  color: ColorsConstant.neutral200,
                ),
                width: 70,
                height: 36,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(IconsConstant.trash),
                    const SizedBox(width: 4),
                    Obx(
                      () => Text(
                        'x0${controller.remainingDiscards}',
                        style: TextStylesConstant.nunitoCaptionBold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 14,
            ),
            InkWell(
              onTap: () {},
              customBorder: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Ink(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  color: ColorsConstant.neutral200,
                ),
                width: 70,
                height: 36,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(IconsConstant.cardChallenge),
                    const SizedBox(width: 4),
                    Obx(
                      () => Text(
                        'x0${controller.remainingTake}',
                        style: TextStylesConstant.nunitoCaptionBold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
