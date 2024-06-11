import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';

class CartItemCardWidget extends StatelessWidget {
  final String? name;
  final String? description;
  final String? image;
  final String? price;
  const CartItemCardWidget({
    super.key,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        border: Border.all(
          color: ColorsConstant.neutral200,
          width: 1,
        ),
      ),
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CachedNetworkImage(
                imageUrl: image ?? "",
                width: 70,
                height: 70,
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
              const SizedBox(width: 16),
              SizedBox(
                width: 180,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name ?? "",
                      style: TextStylesConstant.nunitoButtonSemibold,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      description ?? "",
                      style: TextStylesConstant.nunitoCaption.copyWith(
                        color: ColorsConstant.neutral600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'Rp $price',
                      style: TextStylesConstant.nunitoSubtitle.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  SvgPicture.asset(IconsConstant.subtraction),
                  const SizedBox(width: 4),
                  Text(
                    '01',
                    style: TextStylesConstant.nunitoButtonSemibold,
                  ),
                  const SizedBox(width: 4),
                  SvgPicture.asset(IconsConstant.addition),
                  const SizedBox(width: 16),
                ],
              ),
              const SizedBox(height: 8),
            ],
          )
        ],
      ),
    );
  }
}
