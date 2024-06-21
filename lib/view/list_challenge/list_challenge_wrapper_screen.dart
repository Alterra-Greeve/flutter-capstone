import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greeve/routes/app_routes.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view_model/list_challenge_controller.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/images_constant.dart';
import 'package:loading_indicator/loading_indicator.dart';

part 'screens/list_challenge_cancel_screen.dart';
part 'screens/list_challenge_done_screen.dart';
part 'screens/list_challenge_todo_screen.dart';

part 'widgets/list_challenge_coin_item_widget.dart';
part 'widgets/list_challenge_difficulty_item_widget.dart';
part 'widgets/list_challenge_empty_item_widget.dart';
part 'widgets/list_challenge_exp_item_widget.dart';
part 'widgets/list_challenge_menu_active_widget.dart';
part 'widgets/list_challenge_menu_button_widget.dart';
part 'widgets/list_challenge_status_item_widget.dart';
part 'widgets/list_challenge_title_item_widget.dart';

class ListChallengeWrapperScreen extends StatelessWidget {
  const ListChallengeWrapperScreen({super.key});

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
        toolbarHeight: 56,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(IconsConstant.leaderboard),
          ),
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: SvgPicture.asset(IconsConstant.challengeActive),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListChallengeMenuButtonWidget(controller: controller),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Obx(
                () => ListChallengeMenuActiveWidget(
                  activeButton: controller.activeButton.value,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
