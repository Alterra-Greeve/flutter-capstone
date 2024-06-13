import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greeve/routes/app_routes.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view/challenge/widgets/challenge_action_panel_widget.dart';
import 'package:greeve/view/challenge/widgets/challenge_card_swiper_widget.dart';
import 'package:greeve/view_model/challenge_controller.dart';

class ChallengeScreen extends StatelessWidget {
  const ChallengeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ChallengeController controller = Get.put(ChallengeController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tantangan',
          style: TextStylesConstant.nunitoHeading4,
        ),
        toolbarHeight: 56,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(IconsConstant.leaderboard),
          ),
          IconButton(
            onPressed: () {
              Get.toNamed(AppRoutes.listChallenge);
            },
            icon: SvgPicture.asset(IconsConstant.challengeInactive),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: [
              const ChallengeActionPanelWidget(),
              const SizedBox(height: 12),
              ChallengeCardSwiperWidget(controller: controller),
            ],
          ),
        ),
      ),
    );
  }
}
