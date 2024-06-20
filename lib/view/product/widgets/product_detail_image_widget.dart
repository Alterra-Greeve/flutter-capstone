import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view/product/widgets/shimmer/image_card_shimmer_widget.dart';
import 'package:greeve/view/product/widgets/shimmer/images_card_shimmer_widget.dart';
import 'package:greeve/view_model/detail_product_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailImageWidget extends StatelessWidget {
  final DetailProductController controller;
  const ProductDetailImageWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Obx(
              () => controller.isLoadingProduct.value
                  ? const ImageCardShimmerWidget()
                  : CarouselSlider(
                      carouselController: controller.buttonCarouselController,
                      items: controller.productImages
                          .map(
                            (item) => ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: CachedNetworkImage(
                                imageUrl: item,
                                height: 180,
                                width: double.infinity,
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                          )
                          .toList(),
                      options: CarouselOptions(
                        autoPlay: false,
                        enlargeCenterPage: true,
                        aspectRatio: 2.0,
                        viewportFraction: 1,
                        height: 250,
                        initialPage: controller.currentImageIndex.value,
                        onPageChanged: (index, reason) {
                          controller.updateImageIndex(index);
                        },
                      ),
                    ),
            ),
            Obx(
              () => controller.isLoadingProduct.value
                  ? Container()
                  : Positioned(
                      top: 240,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: AnimatedSmoothIndicator(
                          activeIndex: controller.currentImageIndex.value,
                          count: controller.productImages.length,
                          effect: const WormEffect(
                            activeDotColor: ColorsConstant.neutral900,
                            dotColor: ColorsConstant.neutral500,
                            dotHeight: 2,
                            dotWidth: 24,
                          ),
                        ),
                      ),
                    ),
            ),
          ],
        ),
        Obx(
          () => controller.isLoadingProduct.value
              ? const ImagesCardShimmerWidget()
              : Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 48,
                        width: 280,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.only(left: 16),
                          itemCount: controller.productImages.length,
                          itemBuilder: (context, index) {
                            var product = controller.productImages[index];
                            return GestureDetector(
                              onTap: () {
                                controller.updateImageIndex(index);
                              },
                              child: Obx(
                                () => Container(
                                  margin: const EdgeInsets.only(right: 8),
                                  width: 49,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: controller.currentRoundedImageIndex
                                                  .value ==
                                              index
                                          ? ColorsConstant.primary500
                                          : ColorsConstant.neutral200,
                                      width: 2,
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(25),
                                    ),
                                    child: CachedNetworkImage(
                                      imageUrl: product,
                                      width: 48,
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: InkWell(
                          customBorder: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: Ink(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                              color: ColorsConstant.neutral100,
                            ),
                            height: 36,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(IconsConstant.coin),
                                const SizedBox(width: 4),
                                Text(
                                  "+${controller.productData.value?.coin ?? '0'}",
                                  style: TextStylesConstant.nunitoCaptionBold,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ],
    );
  }
}
