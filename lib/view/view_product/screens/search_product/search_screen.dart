import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/images_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view_model/search_product_controller.dart';
import 'package:greeve/global_widgets/global_text_field_widget.dart';

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
                      const SizedBox(height: 130),
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        color: Colors.grey[200],
                        child: Text(
                          'Coba cari produk atau kata kunci',
                          style: TextStylesConstant.nunitoSubtitle2,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      const SizedBox(height: 130),
                      SvgPicture.asset(
                        ImagesConstant.searchEngines,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Text(
                          'Hmm, Kamu belum pernah cari barang nih',
                          style: TextStylesConstant.nunitoHeading4,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Cari barang yang kamu inginkan, yuk!',
                        style: TextStylesConstant.nunitoSubtitle2,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
