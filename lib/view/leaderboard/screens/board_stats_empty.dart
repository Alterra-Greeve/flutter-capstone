import 'package:flutter/material.dart';
import 'package:greeve/utils/constants/images_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';

class BoardStatsEmpty extends StatelessWidget {
  const BoardStatsEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(ImagesConstant.leaderboardEmpty),
          SizedBox(height: 20),
          Text(
            'Belum ada user yang masuk ke Leaderboard',
            style: TextStylesConstant.nunitoHeading4,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
