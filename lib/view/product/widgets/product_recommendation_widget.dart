import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view/product/widgets/recommendation_card_shimmer_widget.dart';
import 'package:greeve/view/product/widgets/recommendation_card_widget.dart';
import 'package:greeve/view/product/widgets/see_more_product_card.dart';
import 'package:greeve/view_model/product_controller.dart';

class ProductRecommendationWidget extends StatelessWidget {
  final ProductController controller;
  const ProductRecommendationWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Rekomendasi',
            style: TextStylesConstant.nunitoButtonSemibold,
          ),
          const SizedBox(height: 16),
          Obx(
            () => controller.isLoading.value
                ? ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return const RecommendationCardShimmerWidget();
                    },
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: controller.productsRecommendationData.length,
                    itemBuilder: (context, index) {
                      var product =
                          controller.productsRecommendationData[index];
                      return RecommendationCardWidget(
                        name: product.name!,
                        description: product.description!,
                        imageUrl: product.images![0].imageUrl!,
                        price: product.price.toString(),
                      );
                    }),
          ),
        ],
      ),
    );
  }
}
