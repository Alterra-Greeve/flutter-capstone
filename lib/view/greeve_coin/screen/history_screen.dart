import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/view/greeve_coin/widget/not_found_history.dart';
import 'package:greeve/view_model/greeve_coin_controller.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view/greeve_coin/widget/history_coin_widget.dart';

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
              padding: const EdgeInsets.only(top: 15, bottom: 10),
              controller: controller.tabControllerHistory,
              tabs: controller.categoryTabsHistory,
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: ColorsConstant.white,
              labelStyle: TextStylesConstant.nunitoSubtitle4,
              unselectedLabelColor: ColorsConstant.neutral400,
              labelPadding: const EdgeInsets.symmetric(horizontal: 30.0),
            ),
            Expanded(
              child: Obx(
                () => TabBarView(
                  controller: controller.tabControllerHistory,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (controller.coinData.isEmpty &&
                            controller.coinDataSpending.isEmpty)
                          const NotFoundHistoryCoinWidget()
                        else
                          Expanded(
                            child: ListView.builder(
                              itemCount: controller.coinData.length +
                                  controller.coinDataSpending.length,
                              itemBuilder: (context, index) {
                                if (index < controller.coinData.length) {
                                  final item = controller.coinData[index];
                                  return HistoryCoinWidget(
                                    controller: controller,
                                    id: item.id,
                                    name: item.name,
                                    type: item.type,
                                    coin: item.coin,
                                    date: item.date,
                                    spending: false,
                                  );
                                } else {
                                  final item = controller.coinDataSpending[
                                      index - controller.coinData.length];
                                  return HistoryCoinWidget(
                                    controller: controller,
                                    id: item.id,
                                    name: item.name,
                                    coin: item.coin,
                                    date: item.date,
                                    spending: true,
                                  );
                                }
                              },
                            ),
                          ),
                      ],
                    ),
                    Obx(
                      () => controller.coinData.isEmpty
                          ? const NotFoundHistoryCoinWidget()
                          : ListView.builder(
                              itemCount: controller.coinData.length,
                              itemBuilder: (context, index) {
                                final item = controller.coinData[index];
                                return HistoryCoinWidget(
                                  controller: controller,
                                  id: item.id,
                                  name: item.name,
                                  type: item.type,
                                  coin: item.coin,
                                  date: item.date,
                                  spending: false,
                                );
                              },
                            ),
                    ),
                    Obx(
                      () => controller.coinDataSpending.isEmpty
                          ? const NotFoundHistoryCoinWidget()
                          : ListView.builder(
                              itemCount: controller.coinDataSpending.length,
                              itemBuilder: (context, index) {
                                final item = controller.coinDataSpending[index];
                                return HistoryCoinWidget(
                                  controller: controller,
                                  id: item.id,
                                  name: item.name,
                                  coin: item.coin,
                                  date: item.date,
                                  spending: true,
                                );
                              },
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
