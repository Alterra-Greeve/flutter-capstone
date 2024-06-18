import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/view_model/greeve_coin_controller.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view/greeve_coin/widget/voucher_widget.dart';

class AllVoucherScreen extends StatelessWidget {
  const AllVoucherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AllVoucherController controller = Get.put(AllVoucherController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Voucher',
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
      body: Column(
        children: [
          TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            padding: const EdgeInsets.all(15),
            controller: controller.tabController,
            tabs: controller.categoryTabsVoucher,
            indicatorSize: TabBarIndicatorSize.tab,
            dividerColor: ColorsConstant.white,
            labelStyle: TextStylesConstant.nunitoSubtitle4,
            unselectedLabelColor: ColorsConstant.neutral400,
          ),
          Expanded(
            child: Padding(
             padding: const EdgeInsets.all(15.0),
              child: TabBarView(
                controller: controller.tabController,
                children: const [VoucherWidget()],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
