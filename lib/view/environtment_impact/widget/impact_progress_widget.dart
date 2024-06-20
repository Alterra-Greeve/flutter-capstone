import 'package:flutter/material.dart';
import 'package:greeve/utils/constants/colors_constant.dart';

class ImpactProgressIndicatorWidget extends StatelessWidget {
  const ImpactProgressIndicatorWidget({
    super.key,
    required this.monthlyPoint,
  });

  final double monthlyPoint;

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: monthlyPoint,
      backgroundColor: ColorsConstant.primary100,
      borderRadius: BorderRadius.circular(8),
      valueColor:
          const AlwaysStoppedAnimation<Color>(ColorsConstant.primary500),
    );
  }
}
