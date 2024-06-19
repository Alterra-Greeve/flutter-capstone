import 'package:flutter/material.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view/leaderboard/screens/board_stats.dart';
import 'package:greeve/view_model/leaderboard_controller.dart';

class NewLeaderboard extends StatefulWidget {
  const NewLeaderboard({super.key});

  @override
  State<NewLeaderboard> createState() => _NewLeaderboardState();
}

class _NewLeaderboardState extends State<NewLeaderboard> {
  final LeaderboardController _leaderController = LeaderboardController();

  @override
  Widget build(BuildContext context) {
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
      body: SizedBox.expand(
        child: DraggableScrollableSheet(
            builder: (context, ScrollController scrollController) {
          return Container(
            color: Colors.amber,
            child: BoardStats(scrollController: scrollController),
          );
        }),
      ),
    );
  }
}
