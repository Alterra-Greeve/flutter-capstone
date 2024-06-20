import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greeve/models/api_responses/leaderboard_response_model.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/images_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view/leaderboard/screens/boardsheet_stats.dart';
import 'package:greeve/view/leaderboard/screens/bottomsheet_board_stats.dart';
import 'package:greeve/view/leaderboard/screens/bottomsheet_board_stats_two.dart';
import 'package:greeve/view/leaderboard/screens/container_info.dart';
import 'package:greeve/view/leaderboard/screens/empty_stats.dart';
import 'package:greeve/view/leaderboard/screens/leaderboard_appbar.dart';
import 'package:greeve/view/leaderboard/screens/placement.dart';
import 'package:greeve/view_model/leaderboard_controller.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LeaderboardController _leaderController = LeaderboardController();
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text(
      //     'Leaderboard',
      //     style: TextStylesConstant.nunitoHeading4,
      //   ),
      //   actions: [
      //     IconButton(
      //       onPressed: () {
      //         _leaderController.showHelpBottomSheet(context);
      //       },
      //       icon: Image.asset(IconsConstant.help_),
      //     ),
      //   ],
      //   backgroundColor: Colors.transparent,
      // ),
      body: Stack(
        children: [
          // Gradient Background
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImagesConstant.bgLeaderBoard),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Circle Background
          Positioned(
            top: 200,
            left: 4,
            child: Center(
              child: Container(
                width: 380,
                height: 270,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImagesConstant.circleLeaderBoard),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          // Time Container Info
          Positioned(
            top: 130,
            left: 20,
            child: Center(
              child: Obx(() {
                if (_leaderController.leaderboardData.isEmpty) {
                  return ContainerInfo(
                      item: Datum(positionChange: 0)); // Provide default data
                } else {
                  final Datum item = _leaderController
                      .leaderboardData.first; // Change logic as needed
                  return ContainerInfo(item: item);
                }
              }),
            ),
          ),
          LeaderboardAppbar(),
          // Placement Bar
          Placement(),
          // Sliding Up Panel
          BoardsheetStats()
        ],
      ),
    );
  }
}
