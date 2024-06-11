import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view/product/widgets/shimmer/paragraph_shimmer_widget.dart';
import 'package:greeve/view_model/detail_product_controller.dart';
import 'package:intl/intl.dart';

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
                      Flexible(
                        child: Text(
                          controller.productData.value?.name ?? "-",
                          style: TextStylesConstant.nunitoSemiboldTitle,
                        ),
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
                            "Rp ${controller.productData.value?.price != null ? NumberFormat.currency(locale: 'id_ID', symbol: '', decimalDigits: 0).format(controller.productData.value!.price) : '-'}",
                            style: TextStylesConstant.nunitoSubtitle3,
                          ),
                        ],
                      ),
                    ],
                  ),
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
