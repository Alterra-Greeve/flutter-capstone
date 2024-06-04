import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view/product/widgets/product_by_category_widget.dart';
import 'package:greeve/view/product/widgets/product_carousel_slider_widget.dart';
import 'package:greeve/view/product/widgets/product_recommendation_widget.dart';
import 'package:greeve/view_model/product_controller.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController controller = Get.put(ProductController());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mau beli apa hari ini?',
          style: TextStylesConstant.nunitoHeading4,
        ),
        toolbarHeight: 56,
        scrolledUnderElevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(IconsConstant.search),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(IconsConstant.bag),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductCarouselSliderWidget(controller: controller),
            ProductByCategoryWidget(controller: controller),
            ProductRecommendationWidget(controller: controller),
          ],
        ),
      ),
    );
  }
}
