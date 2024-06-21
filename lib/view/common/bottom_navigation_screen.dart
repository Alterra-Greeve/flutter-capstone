import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view/challenge/screens/challenge_screen.dart';
import 'package:greeve/view/environtment_impact/screen/impact_screen.dart';
import 'package:greeve/view/home/screens/home_screen.dart';
import 'package:greeve/view/product/screens/product_screen.dart';
import 'package:greeve/view/user_profile/screens/user_profile_screen.dart';
import 'package:greeve/view_model/bottom_navigation_controller.dart';

class BottomNavScreen extends StatelessWidget {
  const BottomNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNavController controller = Get.put(BottomNavController());
    return Scaffold(
      body: Obx(
        () {
          return IndexedStack(
              index: controller.selectedIndex.value,
              children: [
                const HomeScreen(),
                const ChallengeScreen(),
                const ProductScreen(),
                ImpactScreen(),
                const UserProfileScreen(),
              ]);
        },
      ),
      bottomNavigationBar: SizedBox(
        height: 88,
        child: Obx(
          () => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: controller.selectedIndex.value,
            onTap: controller.onItemTapped,
            showUnselectedLabels: true,
            unselectedLabelStyle: TextStylesConstant.nunitoButtonMedium,
            selectedLabelStyle: TextStylesConstant.nunitoButtonMedium,
            selectedItemColor: ColorsConstant.primary500,
            unselectedItemColor: ColorsConstant.neutral500,
            items: [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: SvgPicture.asset(
                    controller.selectedIndex.value == 0
                        ? IconsConstant.homeNavOn
                        : IconsConstant.homeNavOff,
                  ),
                ),
                label: 'Beranda',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: SvgPicture.asset(
                    controller.selectedIndex.value == 1
                        ? IconsConstant.challengeNavOn
                        : IconsConstant.challengeNavOff,
                  ),
                ),
                label: 'Tantangan',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: SvgPicture.asset(
                    controller.selectedIndex.value == 2
                        ? IconsConstant.productNavOn
                        : IconsConstant.productNavOff,
                  ),
                ),
                label: 'Produk',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: SvgPicture.asset(
                    controller.selectedIndex.value == 3
                        ? IconsConstant.impactNavOn
                        : IconsConstant.impactNavOff,
                  ),
                ),
                label: 'Dampak',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: SvgPicture.asset(
                    controller.selectedIndex.value == 4
                        ? IconsConstant.profileNavOn
                        : IconsConstant.profileNavOff,
                  ),
                ),
                label: 'Profil',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
