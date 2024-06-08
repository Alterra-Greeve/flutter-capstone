import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:greeve/utils/constants/images_constant.dart';
import 'package:greeve/utils/constants/colors_constant.dart';

class ChallengeController extends GetxController {
  var images = [
    ImagesConstant.forgotPass,
    ImagesConstant.onboardingImage2,
    ImagesConstant.onboardingImage3,
    ImagesConstant.onboardingImage1,
    ImagesConstant.registerSuccessImage,
  ];

  var cardColors = <Color>[].obs;

  @override
  void onInit() {
    super.onInit();
    initializeCardColors();
  }

  void initializeCardColors() {
    List<Color> baseColors = [
      ColorsConstant.info300,
      ColorsConstant.danger300,
      ColorsConstant.warning300,
    ];

    cardColors.value = List.generate(images.length, (index) {
      return baseColors[index % baseColors.length];
    });
  }
}
