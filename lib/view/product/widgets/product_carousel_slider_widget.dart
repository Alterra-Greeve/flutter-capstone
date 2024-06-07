import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view_model/product_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductCarouselSliderWidget extends StatelessWidget {
  final ProductController controller;
  const ProductCarouselSliderWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: controller.carouselItems
              .map(
                (item) => Padding(
                  padding: const EdgeInsets.all(16),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          item.image!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 20,
                        right: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Produk Terbaru',
                              style:
                                  TextStylesConstant.nunitoSubtitle3.copyWith(
                                color: ColorsConstant.neutral50,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              item.name!,
                              style: TextStylesConstant.nunitoTitleBold
                                  .copyWith(color: ColorsConstant.neutral50),
                            ),
                            const SizedBox(height: 24),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: 138,
                                height: 40,
                                decoration: const BoxDecoration(
                                  color: ColorsConstant.primary500,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'Beli Sekarang',
                                    style: TextStylesConstant.nunitoButtonMedium
                                        .copyWith(
                                      color: ColorsConstant.neutral100,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 2.0,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              controller.updateIndex(index);
            },
          ),
        ),
        Obx(
          () => AnimatedSmoothIndicator(
            activeIndex: controller.currentIndex.value,
            count: controller.carouselItems.length,
            effect: const WormEffect(
              activeDotColor: ColorsConstant.primary500,
              dotColor: ColorsConstant.neutral500,
              dotHeight: 2,
              dotWidth: 24,
            ),
          ),
        ),
      ],
    );
  }
}
