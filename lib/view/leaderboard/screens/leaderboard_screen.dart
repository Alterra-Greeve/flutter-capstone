import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/images_constant.dart';
import 'package:greeve/view/leaderboard/bottomsheet_board_stats.dart';
import 'package:greeve/view/leaderboard/screens/placement.dart';
import 'package:greeve/view/leaderboard/screens/board_stats.dart';
import 'package:greeve/view/leaderboard/screens/container_info.dart';
import 'package:greeve/view/leaderboard/screens/leaderboard_appbar.dart';
import 'package:greeve/view_model/leaderboard_controller.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final LeaderboardController controller = LeaderboardController();
    return Scaffold(
      body: Stack(
        children: [
          // Gradient Background
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImagesConstant
                      .bgLeaderBoard), // Assuming bgLeaderBoard is an SVG asset
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          /* LEADEBOARD APP BAR */
          LeaderboardAppbar(),

          /* Circle Background */
          Positioned(
            top: 200,
            left: 4,
            child: Center(
              child: Container(
                width: 380,
                height: 270,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImagesConstant
                        .circleLeaderBoard), // Assuming bgLeaderBoard is an SVG asset
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),

          /* TIME CONTAINER INFO */
          Positioned(
            top: 130,
            left: 20,
            child: Center(child: ContainerInfo()),
          ),

          /* PLACEMENT BAR */
          Placement(),

          /* BOARD STATS */
          BottomsheetBoardStats(),
        ],
      ),
    );
  }
}
