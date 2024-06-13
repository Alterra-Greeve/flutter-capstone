import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view/product/widgets/product_card_widget.dart';
import 'package:greeve/view/product/widgets/see_more_product_card_widget.dart';
import 'package:greeve/view/product/widgets/shimmer/product_card_shimmer_widget.dart';
import 'package:greeve/view_model/home_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:greeve/utils/constants/images_constant.dart';
import 'package:greeve/view_model/product_controller.dart';
import 'package:intl/intl.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

part '../widgets/home_app_bar_widget.dart';
part '../widgets/home_product_carousel_widget.dart';
part '../widgets/home_wrapper_content_widget.dart';
part '../widgets/home_content_widget.dart';
part '../widgets/home_category_product_widget.dart';
part '../widgets/home_user_detail_widget.dart';
part '../widgets/home_user_detail_item_widget.dart';
part '../widgets/home_recomended_product_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: HomeAppBarWidget(),
            ),
            HomeWrapperContentWidget(),
          ],
        ),
      ),
    ));
  }
}
