import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';

class ProfileMenuCardWidget extends StatelessWidget {
  final String menuTitle;
  final String menuIcon;
  final void Function()? onTap;
  const ProfileMenuCardWidget({
    super.key,
    required this.menuTitle,
    required this.menuIcon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: ColorsConstant.neutral300,
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(menuIcon),
                  const SizedBox(width: 12),
                  Text(
                    menuTitle,
                    style: TextStylesConstant.nunitoButtonLarge.copyWith(
                      color: ColorsConstant.neutral900,
                    ),
                  ),
                ],
              ),
              SvgPicture.asset(IconsConstant.right),
            ],
          ),
        ),
      ),
    );
  }
}
