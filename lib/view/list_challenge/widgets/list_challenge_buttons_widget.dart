import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view_model/list_challenge_controller.dart';

class ListChallengeButtonsWidget extends StatelessWidget {
  final ListChallengeController controller;

  const ListChallengeButtonsWidget({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildTextButton('Lakukan'),
        _buildTextButton('Selesai'),
        _buildTextButton('Dibatalkan'),
      ],
    );
  }

  Widget _buildTextButton(String title) {
    return Obx(() {
      bool isActive = controller.activeButton.value == title;
      return Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isActive ? ColorsConstant.primary500 : Colors.transparent,
              width: 1,
            ),
          ),
        ),
        child: TextButton(
          onPressed: () {
            controller.setActiveButton(title);
          },
          style: TextButton.styleFrom(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            title,
            style: isActive
                ? TextStylesConstant.nunitoSemiBoldButton.copyWith(
                    color: ColorsConstant.neutral900,
                  )
                : TextStylesConstant.nunitoSemiBoldButton.copyWith(
                    color: ColorsConstant.neutral400,
                  ),
          ),
        ),
      );
    });
  }
}
