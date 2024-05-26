import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';

class GlobalTextFieldWidget extends StatelessWidget {
  final FocusNode focusNode;
  final TextEditingController controller;
  final String? errorText;
  final String? hintText;
  final String prefixIcon;
  final String? suffixIcon;
  final void Function(String)? onChanged;
  final bool showSuffixIcon;
  final bool obscureText;
  final void Function()? onPressedSuffixIcon;

  const GlobalTextFieldWidget({
    super.key,
    required this.focusNode,
    required this.controller,
    required this.errorText,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    required this.showSuffixIcon,
    this.obscureText = false,
    this.onPressedSuffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStylesConstant.nunitoButtonMedium.copyWith(
          color: ColorsConstant.neutral400,
          height: 1.25,
        ),
        errorText: errorText,
        contentPadding: const EdgeInsets.symmetric(vertical: 8),
        isDense: true,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            prefixIcon,
            colorFilter: ColorFilter.mode(
                focusNode.hasFocus || controller.text != ''
                    ? ColorsConstant.neutral800
                    : ColorsConstant.neutral500,
                BlendMode.srcIn),
          ),
        ),
        suffixIcon: showSuffixIcon
            ? Padding(
                padding: const EdgeInsets.all(1.0),
                child: IconButton(
                  onPressed: onPressedSuffixIcon,
                  icon: SvgPicture.asset(
                    obscureText ? IconsConstant.hide : IconsConstant.show,
                    colorFilter: ColorFilter.mode(
                      focusNode.hasFocus || controller.text != ''
                          ? ColorsConstant.neutral800
                          : ColorsConstant.neutral500,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              )
            : null,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0.5,
            color: controller.text != ''
                ? ColorsConstant.neutral800
                : ColorsConstant.neutral500,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(7),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0.5,
            color: ColorsConstant.neutral800,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(7),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0.5,
            color: ColorsConstant.danger500,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(7),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0.5,
            color: ColorsConstant.danger500,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(7),
          ),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
