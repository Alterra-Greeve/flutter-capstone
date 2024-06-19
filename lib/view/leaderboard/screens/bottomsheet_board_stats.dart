import 'package:flutter/material.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view/leaderboard/screens/board_stats.dart';
import 'package:greeve/view/leaderboard/screens/board_stats_two.dart';
import 'package:greeve/view_model/leaderboard_controller.dart';

class BottomsheetBoardStats extends StatelessWidget {
  const BottomsheetBoardStats({super.key});

  @override
  Widget build(BuildContext context) {
    // Adjust this value based on the actual height of the LeaderboardAppBar

    final double appBarHeight = 245;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double maxChildSize = (screenHeight - appBarHeight) / screenHeight;
    // final DraggableScrollableController sheetControllerr =
    //     DraggableScrollableController();

    return SizedBox.expand(
      child: DraggableScrollableSheet(
        // controller: sheetControllerr,
        initialChildSize: 0.3,
        minChildSize: 0.3,
        maxChildSize: maxChildSize,
        builder: (context, ScrollController scrollController) {
          return Container(
              // clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: ColorsConstant.neutral100,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: BoardStats(
                scrollController: scrollController,
              ));
        },
      ),
    );
  }
}
