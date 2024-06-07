import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view/product/widgets/product_detail_image_widget.dart';
import 'package:greeve/view/product/widgets/product_detail_information_widget.dart';
import 'package:greeve/view_model/detail_product_controller.dart';

class DetailProductScreen extends StatelessWidget {
  const DetailProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DetailProductController controller =
        Get.put(DetailProductController());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Produk',
          style: TextStylesConstant.nunitoButtonBold,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(IconsConstant.arrow),
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
          SingleChildScrollView(
            child: Column(
              children: [
                ProductDetailImageWidget(controller: controller),
                const ProductDetailInformationWidget(),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              child: Container(
                height: 40,
                margin: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                  color: ColorsConstant.primary500,
                ),
                child: Center(
                  child: Text(
                    'Tambah ke keranjang',
                    style: TextStylesConstant.nunitoButtonLarge.copyWith(
                      color: ColorsConstant.neutral200,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
