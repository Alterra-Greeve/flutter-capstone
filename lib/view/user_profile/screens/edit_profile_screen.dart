import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greeve/global_widgets/global_form_button_widget.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view/user_profile/widgets/edit_profile_form_widget.dart';
import 'package:greeve/view/user_profile/widgets/user_profile_dialog_widget.dart';
import 'package:greeve/view_model/user_profile_controller.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UserProfileController controller = Get.put(UserProfileController());
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 64,
        title: Text(
          'Edit Profil',
          style: TextStylesConstant.nunitoButtonSemibold,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: SvgPicture.asset(IconsConstant.arrow),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            EditProfileFormWidget(controller: controller),
            Obx(
              () => Center(
                child: GlobalFormButtonWidget(
                  text: 'Simpan',
                  onTap: () {
                    showSaveConfirmationDialog(controller);
                  },
                  buttonWidth: 232,
                  isLoading: controller.isLoading.value,
                  isFormValid: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
