import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:greeve/utils/constants/images_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';

class NotFoundHistoryCoinWidget extends StatelessWidget {
  const NotFoundHistoryCoinWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(ImagesConstant.emptyHistoryCoin),
          Text(
            'Hmm! Belum ada riwayat coin',
            style: TextStylesConstant.nunitoSubtitle.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 130),
        ],
      ),
    );
  }
}
