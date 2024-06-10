import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
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
            CarouselSlider(
              items: controller.productImages
                  .map(
                    (item) => ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        item,
                        fit: BoxFit.cover,
                        width: double.infinity,
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
                onPageChanged: (index, reason) {
                  controller.updateImageIndex(index);
                },
              ),
            ),
            Positioned(
              top: 240,
              left: 0,
              right: 0,
              child: Center(
                child: Obx(
                  () => AnimatedSmoothIndicator(
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
        Padding(
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
                        controller.updateRoundedImageIndex(index);
                      },
                      child: Obx(
                        () => Container(
                          margin: const EdgeInsets.only(right: 8),
                          width: 49,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color:
                                  controller.currentRoundedImageIndex.value ==
                                          index
                                      ? ColorsConstant.primary500
                                      : Colors.transparent,
                              width: 2,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(25)),
                            child: Image.asset(
                              product,
                              fit: BoxFit.cover,
                              width: 48,
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
                  onTap: () {},
                  customBorder: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Ink(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      color: ColorsConstant.neutral100,
                    ),
                    width: 70,
                    height: 36,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(IconsConstant.coin),
                        const SizedBox(width: 4),
                        Text(
                          '+20',
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
      ],
    );
  }
}
