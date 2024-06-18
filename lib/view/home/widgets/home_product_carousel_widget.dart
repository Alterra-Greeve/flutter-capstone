part of '../screens/home_screen.dart';

class HomeProductCarouselWidget extends StatelessWidget {
  const HomeProductCarouselWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.put(ProductController());
    return Obx(
      () => Column(
        children: [
          CarouselSlider(
            items: productController.productsRecommendationData
                .take(3)
                .map(
                  (product) => Stack(
                    children: [
                      ClipRRect(
                        child: CachedNetworkImage(
                          imageUrl: product.images![0].imageUrl!,
                          width: double.infinity,
                          imageBuilder: (context, imageProvider) => Container(
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
                      Positioned(
                        left: 8,
                        top: 8,
                        child: SvgPicture.asset(
                          ImagesConstant.logoPotrait,
                          width: 24,
                          height: 24,
                        ),
                      ),
                      Positioned(
                        left: 24,
                        top: 38,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                productController.navigateToProductDetail(
                                  product.productId!,
                                );
                              },
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Segera dapatkan!\n',
                                      style: TextStylesConstant.nunitoTitleBold
                                          .copyWith(
                                        color: ColorsConstant.neutral900,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    TextSpan(
                                      text: product.name,
                                      style: TextStylesConstant.nunitoTitleBold
                                          .copyWith(
                                        color: ColorsConstant.neutral900,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                        'Rp${NumberFormat.currency(locale: 'id_ID', symbol: '', decimalDigits: 0).format(product.price! * 1.5)}\n',
                                    style: TextStylesConstant.nunitoCaption
                                        .copyWith(
                                      fontSize: 10,
                                      color: ColorsConstant.neutral900,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        'Rp${NumberFormat.currency(locale: 'id_ID', symbol: '', decimalDigits: 0).format(product.price)}',
                                    style: TextStylesConstant.nunitoSubtitle4
                                        .copyWith(
                                      color: ColorsConstant.neutral900,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 1.7,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                productController.updateIndex(index);
              },
            ),
          ),
          Transform.translate(
            offset: const Offset(0, -80),
            child: AnimatedSmoothIndicator(
              activeIndex: productController.currentIndex.value,
              count: productController.carouselItems.length,
              effect: const WormEffect(
                activeDotColor: ColorsConstant.primary500,
                dotColor: ColorsConstant.neutral500,
                dotHeight: 2,
                dotWidth: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
