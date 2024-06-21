import 'package:flutter/material.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/view/leaderboard/screens/board_stats.dart';
import 'package:greeve/view/leaderboard/screens/fix_board_stats.dart';

class BoardsheetStats extends StatelessWidget {
  const BoardsheetStats({super.key});

  @override
  Widget build(BuildContext context) {
    final double appBarHeight = 245;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double maxChildSize = (screenHeight - appBarHeight) / screenHeight;

    return SizedBox.expand(
      child: DraggableScrollableSheet(
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
              child: BoardStats(scrollController: scrollController));
        },
      ),
    );
  }
}
