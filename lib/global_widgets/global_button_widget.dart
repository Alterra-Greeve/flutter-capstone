import 'package:flutter/material.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';

class GlobalButtonWidget extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const GlobalButtonWidget({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 48,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: ColorsConstant.neutral200,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          text,
          style: TextStylesConstant.nunitoButtonLarge.copyWith(
            color: ColorsConstant.neutral500,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
