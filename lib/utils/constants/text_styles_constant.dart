import 'package:flutter/material.dart';

class TextStylesConstant {
  static const TextStyle _baseNunito = TextStyle(
    fontFamily: 'Nunito',
  );

  static final TextStyle nunitoHeading3 = _baseNunito.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle nunitoHeading4 = _baseNunito.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle nunitoSubtitle = _baseNunito.copyWith(
    fontSize: 14,
  );

  static final TextStyle nunitoFooter = _baseNunito.copyWith(
    fontSize: 10,
  );

  static final TextStyle nunitoCaption =
      _baseNunito.copyWith(fontSize: 12, fontWeight: FontWeight.w600);

  static final TextStyle nunitoButtonLarge = _baseNunito.copyWith(
      fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white);

  static final TextStyle nunitoButtonMedium =
      _baseNunito.copyWith(fontSize: 12, fontWeight: FontWeight.w500);

  static final TextStyle nunitoSemiBoldButton =
      _baseNunito.copyWith(fontSize: 16, fontWeight: FontWeight.w600);
}
