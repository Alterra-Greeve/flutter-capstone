import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/images_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view/view_product/screens/search_product/search_history_widget.dart';
import 'package:greeve/view_model/search_product_controller.dart';
import 'package:greeve/global_widgets/global_text_field_widget.dart';
// import 'package:greeve/view/view_product/screens/search_product/not_found_widget.dart';
// import 'package:greeve/view/view_product/screens/search_product/empty_state_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchProductController = Get.put(SearchProductController());
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
            controller: TextEditingController(),
            errorText: null,
            prefixIcon: ImagesConstant.search,
            showSuffixIcon: false,
            keyboardType: TextInputType.text,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          // Memeriksa apakah TextField sedang difokuskan
          if (searchFocusNode.hasFocus) {
            // Jika ya, unfokus TextField
            searchFocusNode.unfocus();
          } else {
            // Jika tidak, fokus ke TextField
            searchFocusNode.requestFocus();
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Obx(
              () {
                if (searchProductController.isTextFieldFocused.value) {
                  return Column(
                    children: [
                      const SizedBox(height: 10),
                      Container(
                        width: 328,
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
                } else {
                  return const SearchHistoryWidget();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
