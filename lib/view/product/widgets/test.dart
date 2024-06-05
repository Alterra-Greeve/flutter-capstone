import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view/product/widgets/product_card_widget.dart';
import 'package:greeve/view/product/widgets/see_more_product_card.dart';
import 'package:greeve/view_model/product_controller.dart';
import 'package:shimmer/shimmer.dart';

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
            children: List.generate(controller.categoryTabs.length, (index) {
              return Obx(
                () => controller.isLoading.value
                    ? ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        scrollDirection: Axis.horizontal,
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              width: 160,
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          );
                        },
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.productsData.length + 1,
                        itemBuilder: (context, index) {
                          if (index == controller.productsData.length) {
                            return const SeeMoreProductCard();
                          } else {
                            var product = controller.productsData[index];
                            return ProductCardWidget(
                              name: product.name!,
                              description: product.description!,
                              imageUrl: product.images![0].imageUrl!,
                              price: product.price.toString(),
                            );
                          }
                        },
                      ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
