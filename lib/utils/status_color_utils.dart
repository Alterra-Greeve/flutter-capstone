import 'package:flutter/material.dart';
import 'package:greeve/utils/constants/colors_constant.dart';

Color getDifficultyBackgroundColor(String difficulty) {
  switch (difficulty.toLowerCase()) {
    case 'mudah':
      return ColorsConstant.success100;
    case 'sedang':
      return ColorsConstant.warning100;
    case 'sulit':
      return ColorsConstant.danger100;
    default:
      return Colors.grey.shade200;
  }
}

Color getDifficultyTextColor(String difficulty) {
  switch (difficulty.toLowerCase()) {
    case 'mudah':
      return ColorsConstant.success600;
    case 'sedang':
      return ColorsConstant.warning600;
    case 'sulit':
      return ColorsConstant.danger600;
    default:
      return Colors.grey.shade600;
  }
}

Color getStatusBackgroundColor(String status) {
  switch (status.toLowerCase()) {
    case 'pending':
      return ColorsConstant.warning100;
    case 'berhasil':
      return ColorsConstant.success100;
    case 'gagal':
      return ColorsConstant.danger100;
    default:
      return ColorsConstant.neutral50;
  }
}

Color getStatusTextColor(String status) {
  switch (status.toLowerCase()) {
    case 'pending':
      return ColorsConstant.warning600;
    case 'berhasil':
      return ColorsConstant.success600;
    case 'gagal':
      return ColorsConstant.danger600;
    default:
      return ColorsConstant.neutral900;
  }
}