import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view/product/widgets/shimmer/paragraph_shimmer_widget.dart';
import 'package:greeve/view_model/detail_product_controller.dart';

class ProductDetailInformationWidget extends StatelessWidget {
  final DetailProductController controller;

  const ProductDetailInformationWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? const ParagraphShimmerWidget()
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        controller.productData.value?.name ?? "-",
                        style: TextStylesConstant.nunitoSemiboldTitle,
                      ),
                      Row(
                        children: [
                          // Text(
                          //   'Rp 148.500',
                          //   style: TextStylesConstant.nunitoCaption.copyWith(
                          //       fontSize: 10,
                          //       color: ColorsConstant.danger500,
                          //       decoration: TextDecoration.lineThrough,
                          //       decorationColor: ColorsConstant.danger500),
                          // ),
                          // const SizedBox(width: 4),
                          Text(
                            "Rp ${controller.productData.value?.price.toString() ?? '-'}",
                            style: TextStylesConstant.nunitoSubtitle3,
                          ),
                        ],
                      ),
                    ],
                  ),
                  // const SizedBox(height: 16),
                  // Text(
                  //   'Bahan: Stainless steel 304\n'
                  //   'Kapasitas: 500 ml (17 oz)\n'
                  //   'Dimensi: 23 cm x 7 cm (tinggi x diameter)\n'
                  //   'Berat: 300 gram\n'
                  //   'Warna: Silver, Biru, Hijau, Pink',
                  //   style: TextStylesConstant.nunitoCaption,
                  // ),
                  const SizedBox(height: 16),
                  Text(
                    controller.productData.value?.description ?? "-",
                    style: TextStylesConstant.nunitoCaption.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  const SizedBox(height: 16),
                  Text(
                    'Membantu',
                    style: TextStylesConstant.nunitoButtonSemibold,
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
    );
  }
}
