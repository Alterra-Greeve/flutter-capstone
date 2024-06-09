import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:greeve/view_model/search_controller.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/images_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/global_widgets/global_text_field_widget.dart';
import 'package:greeve/view/search_product/widgets/empty_state_widget.dart';
import 'package:greeve/view/search_product/widgets/search_history_widget.dart';
// ignore: unused_import
import 'package:greeve/view/search_product/widgets/see_all_view_product_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final searchProductController = Get.put(SearchProductController());
    final TextEditingController searchController = TextEditingController();
    final FocusNode searchFocusNode = FocusNode();

    searchFocusNode.addListener(() {
      searchProductController.setFocus(searchFocusNode.hasFocus);
    });

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
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
              searchProductController.saveSearchHistory(value);
              searchController.clear();
            },
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          if (searchFocusNode.hasFocus) {
            searchFocusNode.unfocus();
          } else {
            searchFocusNode.requestFocus();
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Obx(
              () {
                if (searchProductController.isTextFieldFocused.value &&
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
                } else if (searchProductController.historySearch.isNotEmpty) {
                  return SearchHistoryWidget(
                    onItemClick: (value) {
                      searchController.text = value;
                    },
                  );
                } else {
                  return const EmptyStateWidget();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
