import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/view_model/greeve_coin_controller.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class GetCoinCarouselWidget extends StatelessWidget {
  final GreeveCoinController controller;
  const GetCoinCarouselWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: controller.carouselItems
              .map(
                (item) => SizedBox(
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
                              item.name!,
                              style:
                                  TextStylesConstant.nunitoSubtitle3.copyWith(
                                color: ColorsConstant.neutral50,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              item.title!,
                              style: TextStylesConstant.nunitoTitleBold
                                  .copyWith(color: ColorsConstant.neutral50),
                            ),
                            const SizedBox(height: 24),
                            GestureDetector(
                              onTap: () {
                                controller.navigateToHome();
                              },
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
                                    'Mulai Sekarang',
                                    style: TextStylesConstant.nunitoButtonMedium
                                        .copyWith(
                                      fontSize: 14,
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
        const SizedBox(
          height: 16,
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
