import 'package:flutter/material.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/view/leaderboard/screens/board_stats.dart';
import 'package:greeve/view/leaderboard/screens/board_stats_two.dart';

class BottomsheetBoardStatsTwo extends StatelessWidget {
  const BottomsheetBoardStatsTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        builder: (BuildContext context, ScrollController scrollController) {
      return Container(
        color: Colors.amber,
        child: BoardStats(scrollController: scrollController),
      );
    });
  }
}
