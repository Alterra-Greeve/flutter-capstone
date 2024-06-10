
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greeve/view/product/widgets/see_more_product_card.dart';
import 'package:greeve/view/product/widgets/shimmer/product_card_shimmer_widget.dart';
import 'package:greeve/view/product/widgets/product_card_widget.dart';
import 'package:greeve/view_model/product_controller.dart';

class ProductListWidget extends StatelessWidget {
  final ProductController controller;
  const ProductListWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoadingProduct.value
          ? ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context, index) {
                return const ProductCardShimmerWidget();
              },
            )
          : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: controller.productsData.length + 1,
              itemBuilder: (context, index) {
                if (index == controller.productsData.length) {
                  return SeeMoreProductCardWidget(controller: controller);
                } else {
                  var product = controller.productsData[index];
                  return ProductCardWidget(
                    controller: controller,
                    productId: product.productId!,
                    name: product.name,
                    description: product.description,
                    imageUrl: product.images![0].imageUrl,
                    price: product.price.toString(),
                  );
                }
              },
            ),
    );
  }
}
