import 'package:flutter/material.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view/product/widgets/product_card_widget.dart';
import 'package:greeve/view/product/widgets/see_more_product_card.dart';
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
              ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemCount: controller.productItems.length + 1,
                itemBuilder: (context, index) {
                  if (index == controller.productItems.length) {
                    return const SeeMoreProductCard();
                  } else {
                    var product = controller.productItems[index];
                    return ProductCardWidget(
                      name: product.name!,
                      description: product.description!,
                      image: product.image!,
                      price: product.price!,
                    );
                  }
                },
              ),
              ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemCount: controller.productItems.length + 1,
                itemBuilder: (context, index) {
                  if (index == controller.productItems.length) {
                    return const SeeMoreProductCard();
                  } else {
                    var product = controller.productItems[index];
                    return ProductCardWidget(
                      name: product.name!,
                      description: product.description!,
                      image: product.image!,
                      price: product.price!,
                    );
                  }
                },
              ),
              ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemCount: controller.productItems.length + 1,
                itemBuilder: (context, index) {
                  if (index == controller.productItems.length) {
                    return const SeeMoreProductCard();
                  } else {
                    var product = controller.productItems[index];
                    return ProductCardWidget(
                      name: product.name!,
                      description: product.description!,
                      image: product.image!,
                      price: product.price!,
                    );
                  }
                },
              ),
              ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemCount: controller.productItems.length + 1,
                itemBuilder: (context, index) {
                  if (index == controller.productItems.length) {
                    return const SeeMoreProductCard();
                  } else {
                    var product = controller.productItems[index];
                    return ProductCardWidget(
                      name: product.name!,
                      description: product.description!,
                      image: product.image!,
                      price: product.price!,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
