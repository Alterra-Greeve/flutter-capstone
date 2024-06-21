part of '../screens/home_screen.dart';

class HomeProductCarouselWidget extends StatelessWidget {
  final double aspectRatio;

  const HomeProductCarouselWidget({
    super.key,
    required this.aspectRatio,
  });

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.put(ProductController());
    return Column(
      children: [
        CarouselSlider(
          items: [
            ImagesConstant.bannerGreeve1,
            ImagesConstant.bannerGreeve2,
            ImagesConstant.bannerGreeve3,
            ImagesConstant.bannerGreeve4,
            ImagesConstant.bannerGreeve5,
          ]
              .map(
                (image) => Stack(
                  children: [
                    Image.asset(
                      image,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: Container(
                        width: double.infinity,
                        height: 62,
                        decoration: const BoxDecoration(
                          color: ColorsConstant.neutral50,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: aspectRatio,
            viewportFraction: 1,
          ),
        ),
        Transform.translate(
          offset: const Offset(0, -120),
          child: Obx(
            () => AnimatedSmoothIndicator(
              activeIndex: productController.currentIndex.value,
              count: 5,
              effect: const WormEffect(
                activeDotColor: ColorsConstant.primary500,
                dotColor: ColorsConstant.neutral500,
                dotHeight: 2,
                dotWidth: 24,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
