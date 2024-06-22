import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import '../../../view_model/detail_challenge_controller.dart';

class DetailChallengeUploadButtonWidget extends StatelessWidget {
  const DetailChallengeUploadButtonWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final DetailChallengeController controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.addPhoto();
      },
      child: DottedBorder(
        color: ColorsConstant.primary400,
        strokeWidth: 3,
        borderType: BorderType.RRect,
        radius: const Radius.circular(12),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            decoration: const BoxDecoration(
              color: ColorsConstant.primary100,
            ),
            width: double.infinity,
            height: 70,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  IconsConstant.uploadImage,
                  colorFilter: const ColorFilter.mode(
                    ColorsConstant.neutral700,
                    BlendMode.srcIn,
                  ),
                ),
                Text(
                  'Unggah disini',
                  style: TextStylesConstant.nunitoFooter.copyWith(
                    color: ColorsConstant.neutral700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
