import 'package:flutter/material.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view/product/widgets/product_recommendation_card_widget.dart';
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
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: controller.productRecommendationItems.length,
            itemBuilder: (context, index) {
              var product = controller.productRecommendationItems[index];
              return ProductRecommendationCardWidget(
                name: product.name!,
                description: product.description!,
                image: product.image!,
                price: product.price!,
              );
            },
          ),
        ],
      ),
    );
  }
}
