import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
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
      () => controller.isLoadingProduct.value
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
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: controller.impactCategories.map((category) {
                      String imagePath;
                      switch (category) {
                        case 'Hemat Uang':
                          imagePath = IconsConstant.iconCategory1;
                          break;
                        case 'Mengurangi Limbah':
                          imagePath = IconsConstant.iconCategory2;
                          break;
                        case 'Perluas Wawasan':
                          imagePath = IconsConstant.iconCategory3;
                          break;
                        case 'Mengurangi Pemanasan Global':
                          imagePath = IconsConstant.iconCategory4;
                          break;
                        default:
                          imagePath = 'assets/images/default.png';
                          break;
                      }
                      return Container(
                        width: 48,
                        height: 48,
                        decoration: const BoxDecoration(
                          color: ColorsConstant.neutral100,
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8),
                          ),
                          child: Image.asset(
                            imagePath,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
    );
  }
}
