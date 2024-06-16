import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/images_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view_model/product_controller.dart';

class SeeMoreProductCardWidget extends StatelessWidget {
  final ProductController controller;
  const SeeMoreProductCardWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.navigateToSeeAllProducts();
      },
      child: Container(
        width: 180,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              ImagesConstant.productCardBackground,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(''),
              Text(
                'Cek juga produk lainnya di sini',
                style: TextStylesConstant.nunitoSubtitle.copyWith(
                    fontWeight: FontWeight.w600,
                    color: ColorsConstant.neutral900),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Lihat Semua',
                    style: TextStylesConstant.nunitoButtonBold.copyWith(
                      color: ColorsConstant.neutral900,
                    ),
                  ),
                  SvgPicture.asset(IconsConstant.right),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
