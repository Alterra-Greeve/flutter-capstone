import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:greeve/view_model/search_controller.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/images_constant.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/global_widgets/global_text_field_widget.dart';
import 'package:greeve/view/search_product/widgets/not_found_widget.dart';
import 'package:greeve/view/search_product/widgets/empty_state_widget.dart';
import 'package:greeve/view/search_product/widgets/search_history_widget.dart';
import 'package:greeve/view/search_product/widgets/search_product_card_widget.dart';
import 'package:loading_indicator/loading_indicator.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final RxBool isItemSelected = false.obs;
    final searchProductController = Get.put(SearchProductController());
    final TextEditingController searchController = TextEditingController();
    final FocusNode searchFocusNode = FocusNode();

    searchFocusNode.addListener(() {
      searchProductController.setFocus(searchFocusNode.hasFocus);
    });

    if (kDebugMode) {
      print(
          'Error message search product: ${searchProductController.errorMessage.value}');
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 64,
        scrolledUnderElevation: 0,
        backgroundColor: ColorsConstant.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8, top: 3),
          child: IconButton(
            icon: SvgPicture.asset(IconsConstant.arrow),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(right: 8, top: 3),
          child: GlobalTextFieldWidget(
            focusNode: searchFocusNode,
            hintText: 'Cari Produk',
            controller: searchController,
            errorText: null,
            prefixIcon: ImagesConstant.search,
            showSuffixIcon: false,
            keyboardType: TextInputType.text,
            onFieldSubmitted: (value) {
              searchProductController.getProductsbyName(value);
              searchProductController.saveSearchHistory(value);
              searchController.clear();
              isItemSelected.value = true;
              searchProductController.getHistory();
            },
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          searchProductController.getHistory();
          if (searchFocusNode.hasFocus) {
            searchFocusNode.unfocus();
          } else {
            searchProductController.errorMessage.value = null;
            searchFocusNode.requestFocus();
          }
        },
        child: Center(
          child: Obx(
            () {
              if (kDebugMode) {
                print(
                    'Error message search product: ${searchProductController.errorMessage.value}');
              }
              if (searchFocusNode.hasFocus &&
                  searchProductController.historySearch.isNotEmpty) {
                return SearchHistoryWidget(
                  onItemClick: (value) {
                    searchController.text = value;
                  },
                );
              } else if (searchProductController.historySearch.isNotEmpty &&
                  searchProductController.errorMessage.value !=
                      'Produk tidak ditemukan' &&
                  !isItemSelected.value) {
                return SearchHistoryWidget(
                  onItemClick: (value) {
                    searchController.text = value;
                  },
                );
              } else if (searchProductController.isTextFieldFocused.value &&
                  searchProductController.historySearch.isEmpty) {
                return Column(
                  children: [
                    const SizedBox(height: 10),
                    Container(
                      width: 350,
                      height: 68,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: ColorsConstant.neutral200,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'Coba cari produk atau kata kunci',
                          style: TextStylesConstant.nunitoSubtitle3,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
                );
              } else if (searchProductController.errorMessage.value ==
                      'Produk tidak ditemukan' &&
                  !searchProductController.isTextFieldFocused.value) {
                return const NotFoundWidget();
              } else if (isItemSelected.value) {
                if (searchProductController.isLoadingProduct.value) {
                  return Center(
                    child: SizedBox(
                      width: 50,
                      child: LoadingIndicator(
                        indicatorType: Indicator.ballRotateChase,
                        strokeWidth: 4.0,
                        colors: [Theme.of(context).primaryColor],
                      ),
                    ),
                  );
                } else if (searchProductController.productsData.isEmpty) {
                  return const NotFoundWidget();
                } else {
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 18,
                      mainAxisExtent: 220,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: searchProductController.productsData.length,
                    itemBuilder: (context, index) {
                      final item = searchProductController.productsData[index];
                      return SearchProductCardWidget(
                        controller: searchProductController,
                        productId: item.productId,
                        imageUrl: item.images.first.imageUrl,
                        name: item.name,
                        price: item.price.toString(),
                      );
                    },
                  );
                }
              } else if (searchProductController.historySearch.isEmpty &&
                  !searchProductController.isTextFieldFocused.value) {
                return const EmptyStateWidget();
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}
