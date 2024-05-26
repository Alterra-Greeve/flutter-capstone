import 'package:flutter/material.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';

class GlobalButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final bool isFormValid;

  const GlobalButtonWidget({
    super.key,
    required this.text,
    required this.onTap,
    required this.isFormValid,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isFormValid ? onTap : null,
      child: Container(
        width: double.infinity,
        height: 48,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: isFormValid
              ? ColorsConstant.primary500
              : ColorsConstant.neutral200,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          text,
          style: TextStylesConstant.nunitoButtonLarge.copyWith(
            color: isFormValid
                ? ColorsConstant.neutral100
                : ColorsConstant.neutral500,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
