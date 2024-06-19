import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/images_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view_model/leaderboard_controller.dart';

class BoardStatsTwo extends StatelessWidget {
  final ScrollController scrollController;
  const BoardStatsTwo({
    super.key,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    final LeaderboardController controller = Get.put(LeaderboardController());

    return Obx(() {
      // if (controller.isLoading.value) {
      //   return Center(child: CircularProgressIndicator());
      // } else if (controller.leaderboardData.isEmpty) {
      //   return Center(
      //     child: GestureDetector(
      //       onTap: () {
      //         showModalBottomSheet(
      //           context: context,
      //           builder: (BuildContext context) {
      //             return Container(
      //               height: 350,
      //               color: Colors.white,
      //               child: Column(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 children: [
      //                   Image.asset(ImagesConstant.leaderboardEmpty),
      //                   SizedBox(height: 20),
      //                   Text(
      //                     'Belum ada user yang masuk ke Leaderboard',
      //                     style: TextStyle(
      //                       color: Colors.black,
      //                       fontSize: 18,
      //                       fontWeight: FontWeight.bold,
      //                     ),
      //                     textAlign: TextAlign.center,
      //                   ),
      //                 ],
      //               ),
      //             );
      //           },
      //         );
      //       },
      //       child: Text(
      //         'Belum ada user yang masuk ke Leaderboard',
      //         style: TextStyle(
      //           color: Colors.black,
      //           fontSize: 18,
      //           fontWeight: FontWeight.bold,
      //         ),
      //         textAlign: TextAlign.center,
      //       ),
      //     ),
      //   );
      // } else {
      return Column(
        // alignment: AlignmentDirectional.topCenter,
        // clipBehavior: Clip.none,
        children: [
          if (controller.leaderboardData.length > 3) ...[
            SizedBox(
              width: 40,
              child: Divider(
                thickness: 4,
              ),
            )
          ],
          Column(
            children: [
              ListView.builder(
                controller: scrollController,
                // itemCount: controller.leaderboardData.length > 9
                //     ? 8
                //     : controller.leaderboardData.length - 3,
                itemCount: controller.leaderboardData.length - 3,
                itemBuilder: (context, int index) {
                  final item = controller.leaderboardData[index + 3];

                  return Container(
                    child: ListTile(
                      leading: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            item.rank.toString(),
                            style: TextStylesConstant.nunitoTitleBold,
                          ),
                          SizedBox(width: (index >= 0 && index < 6) ? 30 : 20),
                          CircleAvatar(
                            backgroundImage: NetworkImage(item.avatarUrl ?? ''),
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
                  );
                },
                // ),
              ),
            ],
          ),
        ],
      );
    });
  }
}
