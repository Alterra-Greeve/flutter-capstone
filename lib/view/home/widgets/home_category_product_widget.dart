part of '../screens/home_screen.dart';

class HomeCategoryProductWidget extends StatelessWidget {
  const HomeCategoryProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find<HomeController>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 64),
          Text(
            'Kategori Produk',
            style: TextStylesConstant.nunitoHeading4,
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  homeController
                      .navigateToSeeAllProducts('Mengurangi Pemanasan Global');
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: ColorsConstant.neutral400,
                          width: 1,
                        ),
                      ),
                      child: Image.asset(IconsConstant.reduceHeating),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Kurangi\nPemanasan',
                      style: TextStylesConstant.nunitoCaption,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  homeController.navigateToSeeAllProducts('Hemat Uang');
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: ColorsConstant.neutral400,
                          width: 1,
                        ),
                      ),
                      child: Image.asset(IconsConstant.saveMoney),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Hemat Uang',
                      style: TextStylesConstant.nunitoCaption,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  homeController.navigateToSeeAllProducts('Perluas Wawasan');
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: ColorsConstant.neutral400,
                          width: 1,
                        ),
                      ),
                      child: Image.asset(IconsConstant.expandInsight),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Perluas\nWawasan',
                      style: TextStylesConstant.nunitoCaption,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  homeController.navigateToSeeAllProducts('Mengurangi Limbah');
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: ColorsConstant.neutral400,
                          width: 1,
                        ),
                      ),
                      child: Image.asset(IconsConstant.reduceWaste),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Kurangi\nLimbah',
                      style: TextStylesConstant.nunitoCaption,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
