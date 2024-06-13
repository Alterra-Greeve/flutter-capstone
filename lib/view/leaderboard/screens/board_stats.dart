import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/images_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view_model/leaderboard_controller.dart';

class BoardStats extends StatelessWidget {
  final ScrollController scrollController;
  const BoardStats({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    final LeaderboardController controller = Get.put(LeaderboardController());

    return Obx(
      () {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.leaderboardData.isEmpty) {
          return Center(
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      height: 350,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(ImagesConstant
                              .leaderboardEmpty), // Path to your image
                          SizedBox(height: 20),
                          Text(
                            'Belum ada user yang masuk ke Leaderboard',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Text(
                'Belum ada user yang masuk ke Leaderboard',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          );
        } else {
          return Stack(
            alignment: AlignmentDirectional.topCenter,
            clipBehavior: Clip.none,
            children: [
              if (controller.leaderboardData.length > 3) ...[
                Positioned(
                  top: 35,
                  child: Container(
                    width: 60,
                    height: 1.5,
                    color: ColorsConstant.neutral600,
                  ),
                ),
              ],
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: controller.leaderboardData.length - 3,
                  itemBuilder: (context, int index) {
                    final item = controller
                        .leaderboardData[index + 3]; // Mulai dari indeks ke-3
                    return Column(
                      children: [
                        ListTile(
                          leading: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                item.rank.toString(),
                                style: TextStylesConstant.nunitoTitleBold,
                              ),
                              SizedBox(width: 20),
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
                        SizedBox(
                            height: 10), // Menambahkan jarak antara ListTile
                      ],
                    );
                  },
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
