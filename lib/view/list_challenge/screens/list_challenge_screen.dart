import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greeve/view/list_challenge/widgets/list_challenge_buttons_widget.dart';
import 'package:greeve/view/list_challenge/widgets/list_challenge_item_widget.dart';
// import 'package:greeve/view/list_challenge/widgets/list_challenge_menu_active_widget.dart';
import 'package:greeve/view/list_challenge/widgets/list_challenge_menu_widget.dart';
import 'package:greeve/view_model/list_challenge_controller.dart';

class ListChallengeScreen extends StatelessWidget {
  const ListChallengeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ListChallengeController controller =
        Get.put(ListChallengeController());

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: <Widget>[
              const ListChallengeMenuWidget(),
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
