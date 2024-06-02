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
  final String? prefixIcon;
  final String? helperText;
  final void Function(String)? onChanged;
  final bool showSuffixIcon;
  final bool obscureText;
  final void Function()? onPressedSuffixIcon;
  final bool? enabled;
  final TextInputType keyboardType;

  const GlobalTextFieldWidget({
    super.key,
    required this.focusNode,
    required this.controller,
    this.errorText,
    this.hintText,
    this.prefixIcon,
    this.helperText,
    this.onChanged,
    required this.showSuffixIcon,
    this.obscureText = false,
    this.onPressedSuffixIcon,
    this.enabled,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
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
            contentPadding: EdgeInsets.symmetric(
              vertical: prefixIcon != null ? 8 : 12,
              horizontal: prefixIcon != null ? 0 : 12,
            ),
            isDense: true,
            prefixIcon: prefixIcon != null
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      prefixIcon!,
                      colorFilter: ColorFilter.mode(
                          focusNode.hasFocus || controller.text.isNotEmpty
                              ? ColorsConstant.neutral800
                              : ColorsConstant.neutral500,
                          BlendMode.srcIn),
                    ),
                  )
                : null,
            suffixIcon: showSuffixIcon
                ? Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: IconButton(
                      onPressed: onPressedSuffixIcon,
                      icon: SvgPicture.asset(
                        obscureText ? IconsConstant.hide : IconsConstant.show,
                        colorFilter: ColorFilter.mode(
                          focusNode.hasFocus || controller.text.isNotEmpty
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
                color: controller.text.isNotEmpty
                    ? ColorsConstant.neutral800
                    : ColorsConstant.neutral500,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(7),
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 0.5,
                color: ColorsConstant.neutral800,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(7),
              ),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 0.5,
                color: ColorsConstant.danger500,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(7),
              ),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 0.5,
                color: ColorsConstant.danger500,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(7),
              ),
            ),
          ),
          onChanged: onChanged,
          enabled: enabled,
          keyboardType: keyboardType,
        ),
        if (helperText != null && controller.text.isEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              helperText!,
              style: TextStylesConstant.nunitoButtonMedium.copyWith(
                color: ColorsConstant.neutral800,
              ),
            ),
          ),
      ],
    );
  }
}
