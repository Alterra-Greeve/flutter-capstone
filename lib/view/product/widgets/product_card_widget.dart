import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view_model/product_controller.dart';
import 'package:intl/intl.dart';

class ProductCardWidget extends StatelessWidget {
  final ProductController controller;
  final String productId;
  final String? name;
  final String? description;
  final String? imageUrl;
  final String? price;

  const ProductCardWidget({
    super.key,
    required this.controller,
    required this.productId,

    required this.name,
    required this.description,
    required this.imageUrl,

    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    final formattedPrice =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0)
            .format(double.parse(price ?? '0'));
    return GestureDetector(
      onTap: () {
        controller.navigateToProductDetail(productId);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
          border: Border.all(color: ColorsConstant.neutral200, width: 1),
        ),
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              child: CachedNetworkImage(
                imageUrl: imageUrl ?? "",
                height: 180,
                width: double.infinity,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name ?? "-",
                    style: TextStylesConstant.nunitoButtonSemibold.copyWith(
                      color: ColorsConstant.neutral900,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    description ?? "-",
                    style: TextStylesConstant.nunitoCaption.copyWith(
                      fontWeight: FontWeight.w400,
                      color: ColorsConstant.neutral900,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        formattedPrice,
                        style: TextStylesConstant.nunitoButtonSemibold,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorsConstant.primary100,
                        ),
                        child: IconButton(
                          onPressed: () {
                            controller.navigateToProductDetail(productId);
                          },
                          icon: SvgPicture.asset(
                            IconsConstant.bag,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}