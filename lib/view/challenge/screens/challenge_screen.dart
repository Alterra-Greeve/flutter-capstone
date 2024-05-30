import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view/challenge/widgets/challenge_action_panel_widget.dart';

class ChallengeScreen extends StatelessWidget {
  const ChallengeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tantangan',
          style: TextStylesConstant.nunitoHeading4,
        ),
        toolbarHeight: 64,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(IconsConstant.leaderboard),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(IconsConstant.challengeActive),
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              ChallengeActionPanelWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
