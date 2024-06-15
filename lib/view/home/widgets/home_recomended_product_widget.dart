part of '../screens/home_screen.dart';

class HomeRecomendedProductWidget extends StatelessWidget {
  const HomeRecomendedProductWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.put(ProductController());

    return Column(
      children: [
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Text(
                'Rekomendasi',
                style: TextStylesConstant.nunitoHeading4,
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  productController.navigateToSeeAllProducts();
                },
                child: Text(
                  'Selengkapnya',
                  style: TextStylesConstant.nunitoButtonLarge
                      .copyWith(color: ColorsConstant.primary500),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 286,
          child: Obx(
            () => productController.isLoadingProduct.value
                ? ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return const ProductCardShimmerWidget();
                    },
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        productController.productsRecommendationData.length + 1,
                    itemBuilder: (context, index) {
                      if (index ==
                          productController.productsRecommendationData.length) {
                        return SeeMoreProductCardWidget(
                            controller: productController);
                      } else {
                        var product =
                            productController.productsRecommendationData[index];
                        return ProductCardWidget(
                          controller: productController,
                          productId: product.productId,
                          name: product.name,
                          description: product.description,
                          imageUrl: product.images[0].imageUrl,
                          price: product.price.toString(),
                        );
                      }
                    },
                  ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
