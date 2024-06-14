import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greeve/routes/app_routes.dart';
import 'package:greeve/services/shared_pref/shared_pref.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view/user_profile/widgets/profile_menu_card_widget.dart';

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          ProfileMenuCardWidget(
            menuTitle: 'Notifikasi',
            menuIcon: IconsConstant.notificationFilled,
            onTap: () {},
          ),
          const SizedBox(height: 12),
          ProfileMenuCardWidget(
            menuTitle: 'Alamat',
            menuIcon: IconsConstant.locationFilled,
            onTap: () {},
          ),
          const SizedBox(height: 12),
          ProfileMenuCardWidget(
            menuTitle: 'Voucher',
            menuIcon: IconsConstant.percentageFilled,
            onTap: () {},
          ),
          const SizedBox(height: 12),
          ProfileMenuCardWidget(
            menuTitle: 'Pusat Bantuan',
            menuIcon: IconsConstant.messageFilled,
            onTap: () {},
          ),
          const SizedBox(height: 12),
          ProfileMenuCardWidget(
            menuTitle: 'Syarat dan Ketentuan',
            menuIcon: IconsConstant.notesFilled,
            onTap: () {},
          ),
          const SizedBox(height: 24),
          InkWell(
            onTap: () {
              SharedPreferencesManager.removeAllKeys();
              Get.offAllNamed(AppRoutes.splashApp);
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
