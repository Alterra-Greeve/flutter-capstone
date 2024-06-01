import 'package:flutter/material.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:loading_indicator/loading_indicator.dart';

class GlobalFormButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final bool isFormValid;
  final bool isLoading;

  const GlobalFormButtonWidget({
    super.key,
    required this.text,
    required this.onTap,
    required this.isLoading,
    this.isFormValid = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isFormValid ? onTap : null,
      child: Ink(
        width: double.infinity,
        height: 48,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: isFormValid
              ? ColorsConstant.primary500
              : ColorsConstant.neutral200,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: isLoading
            ? Center(
                child: SizedBox(
                  width: 50,
                  child: LoadingIndicator(
                    indicatorType: Indicator.ballBeat,
                    strokeWidth: 4.0,
                    colors: [Theme.of(context).secondaryHeaderColor],
                  ),
                ),
              )
            : Text(
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
