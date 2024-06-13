import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';

class ContainerInfo extends StatelessWidget {
  const ContainerInfo({super.key});

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
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SvgPicture.asset(IconsConstant.arrowDown),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '5 Posisi',
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
            decoration: BoxDecoration(color: ColorsConstant.primary100),
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
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Image.asset(IconsConstant.clock_),
                    SizedBox(
                      width: 10,
                    ),
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
