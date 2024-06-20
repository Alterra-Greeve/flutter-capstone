import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greeve/view/user_profile/widgets/profile_menu_widget.dart';
import 'package:greeve/view/user_profile/widgets/user_profile_widget.dart';
import 'package:greeve/view_model/user_profile_controller.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UserProfileController controller = Get.put(UserProfileController());
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            UserProfileWidget(controller: controller),
            const SizedBox(height: 32),
            const ProfileMenuWidget(),
          ],
        )),
      ),
    );
  }
}
