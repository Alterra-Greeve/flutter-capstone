import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view/list_challenge/widgets/list_challenge_buttons_widget.dart';
import 'package:greeve/view/list_challenge/widgets/list_challenge_item_widget.dart';
// import 'package:greeve/view/list_challenge/widgets/list_challenge_menu_active_widget.dart';
import 'package:greeve/view_model/list_challenge_controller.dart';

class ListChallengeScreen extends StatelessWidget {
  const ListChallengeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ListChallengeController controller =
        Get.put(ListChallengeController());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tantangan',
          style: TextStylesConstant.nunitoHeading4,
        ),
        toolbarHeight: 64,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(IconsConstant.leaderboard),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(IconsConstant.challengeActive),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: <Widget>[
              ListChallengeButtonsWidget(controller: controller),
              const SizedBox(height: 20),
              // Obx(() => ListChallengeMenuActiveWidget(activeButton: controller.activeButton.value)),

              Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                return ListChallengeItemWidget(
                    challenges: controller.challengeList);
              }),
            ],
          ),
        ),
      ),
    );
  }
}
