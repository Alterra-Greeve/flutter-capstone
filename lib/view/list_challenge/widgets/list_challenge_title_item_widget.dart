import 'package:flutter/material.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';

class ListChallengeTitleItemWidget extends StatelessWidget {
  final String titleChallenge;
  const ListChallengeTitleItemWidget({
    super.key,
    required this.titleChallenge,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      titleChallenge,
      style: TextStylesConstant.nunitoSubtitle.copyWith(
        fontWeight: FontWeight.w900,
      ),
    );
  }
}
