import 'package:flutter/material.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/view/leaderboard/screens/board_stats_empty.dart';

class EmptyStats extends StatelessWidget {
  const EmptyStats({super.key});

  @override
  Widget build(BuildContext context) {
    // Adjust this value based on the actual height of the LeaderboardAppBar
    final double appBarHeight = 245;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double maxChildSize = (screenHeight - appBarHeight) / screenHeight;

    return DraggableScrollableSheet(
      initialChildSize: 0.3,
      minChildSize: 0.3,
      maxChildSize: maxChildSize,
      builder: (context, ScrollController scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: ColorsConstant.neutral100,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: BoardStatsEmpty(),
          ),
        );
      },
    );
  }
}
