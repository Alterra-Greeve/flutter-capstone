import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:greeve/utils/constants/images_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';

class NotFoundWidget extends StatelessWidget {
  const NotFoundWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 130),
        SvgPicture.asset(
          ImagesConstant.searchEngines,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Text(
            'Hmm, tidak ada hasil yang cocok dengan pencarian Kamu.',
            style: TextStylesConstant.nunitoHeading4,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          'Coba pakai kata kunci yang lain.',
          style: TextStylesConstant.nunitoSubtitle2,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
