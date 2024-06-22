import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greeve/routes/app_routes.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view/user_profile/widgets/profile_menu_card_widget.dart';
import 'package:greeve/view/user_profile/widgets/user_profile_dialog_widget.dart';
import 'package:greeve/view_model/bottom_navigation_controller.dart';

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNavController controller = Get.put(BottomNavController());
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          ProfileMenuCardWidget(
            menuTitle: 'Notifikasi',
            menuIcon: IconsConstant.notificationFilled,
            onTap: () {
              Get.toNamed(AppRoutes.notification);
            },
          ),
          const SizedBox(height: 12),
          ProfileMenuCardWidget(
            menuTitle: 'Riwayat Transaksi',
            menuIcon: IconsConstant.historyFilled,
            onTap: () {
              Get.toNamed(AppRoutes.listTransaction);
            },
          ),
          const SizedBox(height: 12),
          ProfileMenuCardWidget(
            menuTitle: 'Koin Saya & Voucher',
            menuIcon: IconsConstant.percentageFilled,
            onTap: () {
              Get.toNamed(AppRoutes.greeveCoin);
            },
          ),
          const SizedBox(height: 12),
          ProfileMenuCardWidget(
            menuTitle: 'Pusat Bantuan',
            menuIcon: IconsConstant.messageFilled,
            onTap: () {
              Get.toNamed(AppRoutes.helpCenter);
            },
          ),
          const SizedBox(height: 12),
          ProfileMenuCardWidget(
            menuTitle: 'Syarat dan Ketentuan',
            menuIcon: IconsConstant.notesFilled,
            onTap: () {
              Get.toNamed(AppRoutes.termsAndConditions);
            },
          ),
          const SizedBox(height: 24),
          InkWell(
            onTap: () {
              showLogoutConfirmationDialog(controller);
            },
            child: Ink(
              width: 232,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: ColorsConstant.primary500,
                  width: 1,
                ),
              ),
              child: Center(
                child: Text(
                  'Keluar',
                  style: TextStylesConstant.nunitoButtonLarge.copyWith(
                    color: ColorsConstant.primary500,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
