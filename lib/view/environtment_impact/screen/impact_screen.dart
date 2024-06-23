import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:greeve/view/environtment_impact/widget/impact_list_card_widget.dart';
import 'package:greeve/view/environtment_impact/widget/impact_category_widget.dart';
import 'package:greeve/view_model/impact_controller.dart';
import 'package:greeve/view_model/impact_monthly_controller.dart';
import '../../../utils/constants/icons_constant.dart';
import '../../../utils/constants/text_styles_constant.dart';
import '../widget/impact_chart_widget.dart';

class ImpactScreen extends StatelessWidget {
  final ImpactDetailController impactDetailController =
      Get.put(ImpactDetailController());
  final ImpactMonthlyController impactMonthlyController =
      Get.put(ImpactMonthlyController());

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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ImpactCategoryList(
                  impactController: impactMonthlyController,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 450,
                child: Obx(() {
                  return ImpactChartWidget(
                    tooltipBehavior:
                        impactDetailController.tooltipBehavior.value,
                  );
                }),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ImpactListCardWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
