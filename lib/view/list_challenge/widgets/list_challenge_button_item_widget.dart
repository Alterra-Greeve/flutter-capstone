import 'package:flutter/material.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';

class ListChallengeButtonItemWidget extends StatelessWidget {
  const ListChallengeButtonItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: ColorsConstant.primary500,
        borderRadius: BorderRadius.circular(
          8,
        ),
      ),
      child: Text(
        'Selesaikan Misi',
        textAlign: TextAlign.center,
        style: TextStylesConstant.nunitoCaptionBold.copyWith(
          color: ColorsConstant.neutral100,
        ),
      ),
    );
  }
}
