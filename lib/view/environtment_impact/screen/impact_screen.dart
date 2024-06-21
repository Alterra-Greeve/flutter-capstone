import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:greeve/view/environtment_impact/screen/detail_impact_screen.dart';
import 'package:greeve/view/environtment_impact/widget/impact_card_widget.dart';
import 'package:greeve/view/environtment_impact/widget/impact_category_widget.dart';
import '../../../utils/constants/colors_constant.dart';
import '../../../utils/constants/icons_constant.dart';
import '../../../utils/constants/images_constant.dart';
import '../../../utils/constants/text_styles_constant.dart';
import '../impact_controller.dart';
import '../widget/impact_chart_widget.dart';

class ImpactScreen extends StatelessWidget {
  final ImpactController impactController = Get.put(ImpactController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Overview Impact',
            style: TextStylesConstant.nunitoButtonBold,
          ),
          centerTitle: true,
          toolbarHeight: 64,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ImpactCategoryList(
                  impactController: impactController,
                ),
                SizedBox(height: 16),
                Container(
                  height: 450,
                  child: Obx(() {
                    return ImpactChartWidget(
                      tooltipBehavior: impactController.tooltipBehavior.value,
                      chartData: impactController.selectedChartData,
                    );
                  }),
                ),
                SizedBox(height: 16),
                ImpactCardWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
