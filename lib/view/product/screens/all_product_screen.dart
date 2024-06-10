import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greeve/models/api_responses/products_response_model.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:shimmer/shimmer.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view/product/widgets/search_product_card_widget.dart';
import 'package:greeve/view_model/all_product_controller.dart';

class AllProductScreen extends StatelessWidget {
  const AllProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AllProductScreenController controller =
        Get.put(AllProductScreenController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dapur',
          style: TextStylesConstant.nunitoButtonBold,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(
            IconsConstant.arrow,
          ),
        ),
        toolbarHeight: 64,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(IconsConstant.bag),
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            top: kToolbarHeight,
            child: PagedGridView<int, Datum>(
              pagingController: controller.pagingController,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 18,
                mainAxisSpacing: 16,
                mainAxisExtent: 220,
              ),
              builderDelegate: PagedChildBuilderDelegate<Datum>(
                itemBuilder: (context, item, index) {
                  return SearchProductCardWidget(
                    controller: controller,
                    productId: item.productId!,
                    imageUrl: item.images?[0].imageUrl,
                    name: item.name,
                    price: item.price.toString(),
                  );
                },
                firstPageProgressIndicatorBuilder: (context) => SizedBox(
                  height: 211,
                  child: GridView.builder(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 18,
                      mainAxisSpacing: 16,
                      mainAxisExtent: 220,
                    ),
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade200,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                newPageProgressIndicatorBuilder: (context) => Center(
                  child: SizedBox(
                    width: 50,
                    child: LoadingIndicator(
                      indicatorType: Indicator.ballBeat,
                      strokeWidth: 4.0,
                      colors: [Theme.of(context).primaryColor],
                    ),
                  ),
                ),
                noMoreItemsIndicatorBuilder: (context) => Center(
                  child: Text(
                    "Tidak ada item lagi",
                    style: TextStylesConstant.nunitoSubtitle,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(7),
                      ),
                      border: Border.all(
                        color: ColorsConstant.neutral500,
                        width: 0.5,
                      ),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 8),
                        SvgPicture.asset(IconsConstant.search),
                        const SizedBox(width: 8),
                        Text(
                          'Cari produk...',
                          style: TextStylesConstant.nunitoButtonMedium.copyWith(
                            color: ColorsConstant.neutral400,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
