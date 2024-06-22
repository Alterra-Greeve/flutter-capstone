import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greeve/models/api_responses/leaderboard_response_model.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';

class ContainerInfo extends StatelessWidget {
  final Datum item;

  const ContainerInfo({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: 350,
      decoration: BoxDecoration(
          color: ColorsConstant.neutral100,
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Hari ini', style: TextStylesConstant.nunitoTitleBold),
                const SizedBox(height: 10),
                Row(
                  children: [
                    if (item.positionChange != null) ...[
                      if (item.positionChange! >= 5)
                        SvgPicture.asset(IconsConstant.arrowUp)
                      else if (item.positionChange! <= -5)
                        SvgPicture.asset(IconsConstant.arrowDown)
                      else
                        Image.asset(IconsConstant.decrease_),
                    ] else
                      Image.asset(IconsConstant.decrease_),
                    const SizedBox(width: 10),
                    Text(
                      '${item.positionChange?.abs() ?? 0} Posisi',
                      style: TextStylesConstant.nunitoSubtitle4,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 120,
            width: 1,
            decoration: const BoxDecoration(color: ColorsConstant.primary100),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sisa Waktu',
                  style: TextStylesConstant.nunitoTitleBold,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Image.asset(IconsConstant.clock_),
                    const SizedBox(width: 10),
                    Text(
                      '30 Hari',
                      style: TextStylesConstant.nunitoSubtitle4,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
