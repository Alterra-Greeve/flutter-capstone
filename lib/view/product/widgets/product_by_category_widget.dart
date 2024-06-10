import 'package:flutter/material.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view/product/widgets/product_list_widget.dart';
import 'package:greeve/view_model/product_controller.dart';

class ProductByCategoryWidget extends StatelessWidget {
  final ProductController controller;
  const ProductByCategoryWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          tabAlignment: TabAlignment.start,
          controller: controller.tabController,
          padding: const EdgeInsets.all(16),
          tabs: controller.categoryTabs,
          indicatorSize: TabBarIndicatorSize.tab,
          dividerColor: ColorsConstant.white,
          labelStyle: TextStylesConstant.nunitoButtonSemibold.copyWith(
            color: ColorsConstant.neutral900,
          ),
          unselectedLabelColor: ColorsConstant.neutral400,
          isScrollable: true,
        ),
        SizedBox(
          height: 286,
          child: TabBarView(
            controller: controller.tabController,
            children: [
              ProductListWidget(controller: controller),
              ProductListWidget(controller: controller),
              ProductListWidget(controller: controller),
              ProductListWidget(controller: controller),
            ],
          ),
        ),
      ],
    );
  }
}
