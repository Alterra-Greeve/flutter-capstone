import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/images_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view_model/leaderboard_controller.dart';

class BoardStats extends StatelessWidget {
  final ScrollController scrollController;

  const BoardStats({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LeaderboardController controller = Get.put(LeaderboardController());

    return Obx(
      () {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.leaderboardData.isEmpty) {
          return Center(
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
        } else {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // if (controller.leaderboardData.length > 3) ...[
              //   SizedBox(height: 40),
              //   Container(
              //     width: 60,
              //     height: 1.5,
              //     color: ColorsConstant.neutral600,
              //   ),
              // ],
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListView.builder(
                    shrinkWrap: true,
                    controller: scrollController,
                    // itemCount: controller.leaderboardData.length > 9
                    //     ? 8
                    //     : controller.leaderboardData.length - 3,
                    itemCount: controller.leaderboardData.length - 3,
                    itemBuilder: (context, int index) {
                      final item = controller.leaderboardData[index + 3];
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 10),
                        child: Container(
                          color: index == 1
                              ? Colors.green.withOpacity(0.3)
                              : Colors.transparent,
                          // child: Text('Testing 1'),
                          child: ListTile(
                            leading: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  item.rank.toString(),
                                  style: TextStylesConstant.nunitoTitleBold,
                                ),
                                SizedBox(
                                    width: (index >= 0 && index < 6) ? 30 : 20),
                                CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(item.avatarUrl ?? ''),
                                ),
                              ],
                            ),
                            title: Text(
                              item.name ?? '',
                              style: TextStylesConstant.nunitoTitleBold,
                            ),
                            trailing: Text(
                              item.exp.toString(),
                              style: TextStylesConstant.nunitoTitleBold,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          );
        }
      },
    );
  }
}