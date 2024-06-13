import 'package:flutter/material.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/view/leaderboard/screens/board_stats.dart';

class BottomsheetBoardStats extends StatelessWidget {
  const BottomsheetBoardStats({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.3,
      minChildSize: 0.3,
      maxChildSize: 1,
      builder: (context, ScrollController scrollController) {
        return Container(
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
    );
  }
}
