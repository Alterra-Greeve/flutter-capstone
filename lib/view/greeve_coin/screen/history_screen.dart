import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/images_constant.dart';
import 'package:greeve/view_model/greeve_coin_controller.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';

class HistoryCoinScreen extends StatelessWidget {
  const HistoryCoinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GreeveCoinController controller = Get.put(GreeveCoinController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Koin Saya & Voucher',
          style: TextStylesConstant.nunitoSubtitle4,
        ),
        leading: IconButton(
          icon: SvgPicture.asset(IconsConstant.arrow),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        toolbarHeight: 56,
        scrolledUnderElevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      IconsConstant.coin,
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Obx(
                      () => Text(
                        controller.isLoading.value
                            ? '-'
                            : controller.infoCoinUser.value?.data?.coin
                                    .toString() ??
                                '-',
                        style: TextStylesConstant.nunitoSemiboldTitle,
                      ),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      'Koin Tersedia',
                      style: TextStylesConstant.nunitoReguler,
                    ),
                  ],
                ),
                SizedBox(
                  height: 35,
                  width: 145,
                  child: ElevatedButton(
                    style: TextButton.styleFrom(
                      backgroundColor: ColorsConstant.primary500,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      controller.navigateToBottomSheet();
                    },
                    child: Text(
                      'Dapatkan Koin',
                      style: TextStylesConstant.nunitoButtonLarge,
                    ),
                  ),
                ),
              ],
            ),
            TabBar(
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              controller: controller.tabControllerHistory,
              tabs: controller.categoryTabsHistory,
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: ColorsConstant.white,
              labelStyle: TextStylesConstant.nunitoSubtitle4,
              unselectedLabelColor: ColorsConstant.neutral400,
              labelPadding: const EdgeInsets.symmetric(horizontal: 30.0),
            ),
            Expanded(
              child: TabBarView(
                controller: controller.tabControllerHistory,
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(ImagesConstant.emptyHistoryCoin),
                        Text(
                          'Hmm! Belum ada riwayat coin',
                          style: TextStylesConstant.nunitoSubtitle.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 130),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
