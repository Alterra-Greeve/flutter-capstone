import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view/challenge/widgets/challenge_action_panel_widget.dart';
import 'package:greeve/view/challenge/widgets/challenge_card_swiper_widget.dart';

class ChallengeScreen extends StatefulWidget {
  const ChallengeScreen({super.key});

  @override
  State<ChallengeScreen> createState() => _ChallengeScreenState();
}

class _ChallengeScreenState extends State<ChallengeScreen> {
  @override
  Widget build(BuildContext context) {
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
            onPressed: () {},
            icon: SvgPicture.asset(IconsConstant.challengeInactive),
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: [
              ChallengeActionPanelWidget(),
              SizedBox(height: 12),
              ChallengeCardSwiperWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
