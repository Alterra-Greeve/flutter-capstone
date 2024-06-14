import 'package:flutter/material.dart';
import 'package:greeve/utils/constants/colors_constant.dart';

class TextStylesConstant {
  static const TextStyle _baseNunito = TextStyle(
    fontFamily: 'Nunito',
  );

  static final TextStyle nunitoSemiboldTitle = _baseNunito.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle nunitoExtraBoldTitle = _baseNunito.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w800,
  );

  static final TextStyle nunitoExtraBoldFooter = _baseNunito.copyWith(
    fontSize: 10,
    fontWeight: FontWeight.w800,
  );

  static final TextStyle nunitoHeading3 = _baseNunito.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle nunitoHeading4 = _baseNunito.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle nunitoTitleBold = _baseNunito.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle nunitoSubtitle = _baseNunito.copyWith(
    fontSize: 14,
  );

  static final TextStyle nunitoSubtitle2 = _baseNunito.copyWith(
    fontSize: 17,
    color: ColorsConstant.neutral500,
  );

  static final TextStyle nunitoSubtitle3 = _baseNunito.copyWith(
    fontSize: 14,
    color: ColorsConstant.neutral600,
  );

  static final TextStyle nunitoSubtitle4 = _baseNunito.copyWith(
    fontSize: 16,
    color: ColorsConstant.neutral900,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle nunitoFooter = _baseNunito.copyWith(
    fontSize: 10,
  );

  static final TextStyle nunitoFooterBold = _baseNunito.copyWith(
    fontSize: 10,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle nunitoCaption = _baseNunito.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle nunitoCaptionBold = _baseNunito.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle nunitoButtonLarge = _baseNunito.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static final TextStyle nunitoButtonMedium = _baseNunito.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle nunitoButtonBold = _baseNunito.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle nunitoButtonSemibold = _baseNunito.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle nunitoReguler = _baseNunito.copyWith(
    fontSize: 14,
  );
}
