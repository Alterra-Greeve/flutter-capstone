import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view_model/leaderboard_controller.dart';

class LeaderboardAppbar extends StatelessWidget {
  const LeaderboardAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final LeaderboardController controller = LeaderboardController();
    return Column(
      children: [
        SizedBox(
          height: 60,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Image.asset(IconsConstant.arrowLeft_),
            ),
            Text(
              'Leaderboard',
              style: TextStylesConstant.nunitoHeading4,
            ),
            IconButton(
              onPressed: () {
                controller.showHelpBottomSheet(context);
              },
              icon: Image.asset(IconsConstant.help_),
            ),
          ],
        ),
      ],
    );
  }
}