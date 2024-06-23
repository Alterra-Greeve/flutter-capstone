import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/images_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view_model/leaderboard_controller.dart';

class Placement extends StatelessWidget {
  const Placement({super.key});

  @override
  Widget build(BuildContext context) {
    final LeaderboardController controller = Get.put(LeaderboardController());

    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      } else if (controller.leaderboardData.isEmpty) {
        return const Center(child: Text("No data available"));
      } else {
        final topThree = controller.leaderboardData.take(3).toList();
        return Stack(
          children: [
            Positioned(
              top: 260,
              left: 15,
              child: Center(
                child: Container(
                  width: 360,
                  height: 350,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(ImagesConstant.placementComp),
                    ),
                  ),
                ),
              ),
            ),

            // Positioned(
            //   top: 260,
            //   left: 15,
            //   child: Center(
            //     child: Container(
            //       width: 360,
            //       height: 350,
            //       decoration: const BoxDecoration(
            //         image: DecorationImage(
            //           image: AssetImage(ImagesConstant.firstPlace),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),

            // // Top 2
            // Positioned(
            //   top: 300,
            //   right: -96,
            //   child: Center(
            //     child: Container(
            //       width: 370,
            //       height: 370,
            //       decoration: const BoxDecoration(
            //         image: DecorationImage(
            //           image: AssetImage(ImagesConstant
            //               .thirdPlace), // Assuming bgLeaderBoard is an SVG asset
            //         ),
            //       ),
            //     ),
            //   ),
            // ),

            // // Top 3
            // Positioned(
            //   top: 290,
            //   left: -94,
            //   child: Center(
            //     child: Container(
            //       width: 360,
            //       height: 360,
            //       decoration: const BoxDecoration(
            //         image: DecorationImage(
            //           image: AssetImage(ImagesConstant
            //               .secondPlace), // Assuming bgLeaderBoard is an SVG asset
            //         ),
            //       ),
            //     ),
            //   ),
            // ),

            // Positioned(
            //   top: 290,
            //   left: -94,
            //   child: Center(
            //     child: Container(
            //       width: 360,
            //       height: 360,
            //       decoration: BoxDecoration(
            //         image: DecorationImage(
            //           image: AssetImage(ImagesConstant
            //               .secondPlace), // Assuming bgLeaderBoard is an SVG asset
            //         ),
            //       ),
            //     ),
            //   ),
            // ),

            Positioned(
              top: 260,
              left: 177,
              child: Center(child: SvgPicture.asset(IconsConstant.crone)),
            ),
            // Top 1
            if (topThree.isNotEmpty)
              Positioned(
                top: 290,
                left: 160,
                child: Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.amber,
                            width: 4,
                          ),
                        ),
                      ),
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: topThree[0].avatarUrl != null &&
                                  topThree[0].avatarUrl!.isNotEmpty
                              ? DecorationImage(
                                  image: NetworkImage(topThree[0].avatarUrl!),
                                  fit: BoxFit.cover,
                                )
                              : null,
                        ),
                        child: topThree[0].avatarUrl == null ||
                                topThree[0].avatarUrl!.isEmpty
                            ? Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors
                                      .black, // Fallback color when no image is available
                                ),
                              )
                            : null,
                      ),
                    ],
                  ),
                ),
              ),

            if (topThree.length > 1)
              Positioned(
                top: 355,
                left: 54,
                child: Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.green,
                            width: 4,
                          ),
                        ),
                      ),
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: topThree[1].avatarUrl != null &&
                                  topThree[1].avatarUrl!.isNotEmpty
                              ? DecorationImage(
                                  image: NetworkImage(topThree[1].avatarUrl!),
                                  fit: BoxFit.cover,
                                )
                              : null,
                        ),
                        child: topThree[1].avatarUrl == null ||
                                topThree[1].avatarUrl!.isEmpty
                            ? Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors
                                      .black, // Fallback color when no image is available
                                ),
                              )
                            : null,
                      ),
                    ],
                  ),
                ),
              ),

            if (topThree.length > 2)
              Positioned(
                top: 385,
                right: 54,
                child: Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.blue,
                            width: 4,
                          ),
                        ),
                      ),
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: topThree[2].avatarUrl != null &&
                                  topThree[2].avatarUrl!.isNotEmpty
                              ? DecorationImage(
                                  image: NetworkImage(topThree[2].avatarUrl!),
                                  fit: BoxFit.cover,
                                )
                              : null,
                        ),
                        child: topThree[2].avatarUrl == null ||
                                topThree[2].avatarUrl!.isEmpty
                            ? Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors
                                      .black, // Fallback color when no image is available
                                ),
                              )
                            : null,
                      ),
                    ],
                  ),
                ),
              ),

            // Place position texts
            if (topThree.isNotEmpty)
              Positioned(
                top: 365,
                left: 185,
                child: Text(
                  '1',
                  style: TextStylesConstant.nunitoHeading1Blk,
                ),
              ),
            if (topThree.length > 1)
              Positioned(
                top: 425,
                left: 77,
                child: Text(
                  '2',
                  style: TextStylesConstant.nunitoHeading1Blk,
                ),
              ),
            if (topThree.length > 2)
              Positioned(
                top: 455,
                right: 78,
                child: Text(
                  '3',
                  style: TextStylesConstant.nunitoHeading1Blk,
                ),
              ),

            // Score placement texts
            if (topThree.isNotEmpty)
              Positioned(
                top: 435,
                left: MediaQuery.of(context).size.width / 2 -
                    30, // Center horizontally
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    topThree[0].exp != null ? topThree[0].exp.toString() : '0',
                    style: TextStylesConstant.nunitoHeading2,
                  ),
                ),
              ),
            if (topThree.length > 1)
              Positioned(
                top: 490,
                left: MediaQuery.of(context).size.width / 4 -
                    38, // Center horizontally in the left quarter
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    topThree[1].exp != null ? topThree[1].exp.toString() : '0',
                    style: TextStylesConstant.nunitoHeading2,
                  ),
                ),
              ),
            if (topThree.length > 2)
              Positioned(
                top: 520,
                right: MediaQuery.of(context).size.width / 4 -
                    35, // Center horizontally in the right quarter
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    topThree[2].exp != null ? topThree[2].exp.toString() : '0',
                    style: TextStylesConstant.nunitoHeading2,
                  ),
                ),
              ),

            // Player names

            if (topThree.isNotEmpty)
              Positioned(
                top: 415,
                left: MediaQuery.of(context).size.width / 2 -
                    26, // Center horizontally
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    controller.truncateName(
                      topThree[0].name != null ? topThree[0].name! : '-',
                    ),
                    style: TextStylesConstant.nunitoTitleBold,
                  ),
                ),
              ),
            if (topThree.length > 1)
              Positioned(
                top: 470,
                left: MediaQuery.of(context).size.width / 4 -
                    40, // Center horizontally in the left quarter
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    controller.truncateName(
                      topThree[1].name != null ? topThree[1].name! : '-',
                    ),
                    style: TextStylesConstant.nunitoTitleBold,
                  ),
                ),
              ),
            if (topThree.length > 2)
              Positioned(
                top: 500,
                right: MediaQuery.of(context).size.width / 4 -
                    35, // Center horizontally in the right quarter
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    controller.truncateName(
                      topThree[2].name != null ? topThree[2].name! : '-',
                    ),
                    style: TextStylesConstant.nunitoTitleBold,
                  ),
                ),
              ),
          ],
        );
      }
    });
  }
}
