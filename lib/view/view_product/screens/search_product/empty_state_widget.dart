import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:greeve/utils/constants/images_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({super.key});

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
            'Hmm, Kamu belum pernah cari barang nih',
            style: TextStylesConstant.nunitoHeading4,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          'Cari barang yang kamu inginkan, yuk!',
          style: TextStylesConstant.nunitoSubtitle2,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
