import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view_model/bottom_navigation_controller.dart';

class BottomNavScreen extends StatelessWidget {
  const BottomNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNavController controller = Get.put(BottomNavController());
    return Scaffold(
      body: PageView(
        controller: controller.pageController,
        onPageChanged: controller.onPageChanged,
        children: controller.widgetOptions,
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
                  child: SvgPicture.asset(IconsConstant.impactNavOff),
                ),
                label: 'Dampak',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: SvgPicture.asset(IconsConstant.profileNavOff),
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
