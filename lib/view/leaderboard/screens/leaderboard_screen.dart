import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greeve/models/api_responses/leaderboard_response_model.dart';
import 'package:greeve/utils/constants/images_constant.dart';
import 'package:greeve/view/leaderboard/screens/widgets/bottomsheet_board_stats.dart';
import 'package:greeve/view/leaderboard/widgets/container.dart';
import 'package:greeve/view/leaderboard/widgets/leaderboard_app_bar.dart';
import 'package:greeve/view/leaderboard/widgets/placement.dart';
import 'package:greeve/view_model/leaderboard_controller.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LeaderboardController _leaderController = LeaderboardController();

    return Scaffold(
      extendBodyBehindAppBar: true,
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
          BottomsheetBoardStats()
        ],
      ),
    );
  }
}
