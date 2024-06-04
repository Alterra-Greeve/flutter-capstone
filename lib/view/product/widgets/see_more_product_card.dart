import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greeve/routes/app_routes.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/images_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';

class SeeMoreProductCard extends StatelessWidget {
  const SeeMoreProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.allProduct);
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
