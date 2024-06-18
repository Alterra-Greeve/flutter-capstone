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
                  (product) => Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    color: ColorsConstant.backgroundProduct,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          ImagesConstant.logoPotrait,
                          width: 24,
                          height: 24,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 200,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        productController
                                            .navigateToProductDetail(
                                          product.productId!,
                                        );
                                      },
                                      child: RichText(
                                        overflow: TextOverflow.ellipsis,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Segera dapatkan!\n',
                                              style: TextStylesConstant
                                                  .nunitoTitleBold
                                                  .copyWith(
                                                color:
                                                    ColorsConstant.neutral900,
                                                fontWeight: FontWeight.w900,
                                              ),
                                            ),
                                            TextSpan(
                                              text: product.name,
                                              style: TextStylesConstant
                                                  .nunitoTitleBold
                                                  .copyWith(
                                                color:
                                                    ColorsConstant.neutral900,
                                                fontWeight: FontWeight.w900,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    RichText(
                                      overflow: TextOverflow.ellipsis,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text:
                                                'Rp${NumberFormat.currency(locale: 'id_ID', symbol: '', decimalDigits: 0).format(product.price! * 1.5)}\n',
                                            style: TextStylesConstant
                                                .nunitoCaption
                                                .copyWith(
                                              fontSize: 10,
                                              color: ColorsConstant.neutral900,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                            ),
                                          ),
                                          TextSpan(
                                            text:
                                                'Rp${NumberFormat.currency(locale: 'id_ID', symbol: '', decimalDigits: 0).format(product.price)}',
                                            style: TextStylesConstant
                                                .nunitoSubtitle4
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
                              GestureDetector(
                                onTap: () {
                                  productController.navigateToProductDetail(
                                    product.productId!,
                                  );
                                },
                                child: SizedBox(
                                  width: 80,
                                  height: 80,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        topRight: Radius.circular(22),
                                        bottomLeft: Radius.circular(22),
                                        bottomRight: Radius.circular(8),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: ColorsConstant.neutral900
                                              .withOpacity(0.2),
                                          spreadRadius: 4,
                                          blurRadius: 10,
                                          offset: const Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        topRight: Radius.circular(22),
                                        bottomLeft: Radius.circular(22),
                                        bottomRight: Radius.circular(8),
                                      ),
                                      child: CachedNetworkImage(
                                        imageUrl: product.images![0].imageUrl!,
                                        width: 80,
                                        height: 80,
                                        fit: BoxFit.cover,
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                      ),
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
