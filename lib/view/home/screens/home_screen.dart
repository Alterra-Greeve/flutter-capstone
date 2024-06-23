import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greeve/routes/app_routes.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/utils/helpers/shared_pref_helper.dart';
import 'package:greeve/view/product/widgets/product_card_widget.dart';
import 'package:greeve/view/product/widgets/see_more_product_card_widget.dart';
import 'package:greeve/view/product/widgets/shimmer/product_card_shimmer_widget.dart';
import 'package:greeve/view_model/home_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:greeve/utils/constants/images_constant.dart';
import 'package:greeve/view_model/product_controller.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

part '../widgets/home_product_carousel_widget.dart';
part '../widgets/home_content_widget.dart';
part '../widgets/home_category_product_widget.dart';
part '../widgets/home_user_detail_widget.dart';
part '../widgets/home_user_detail_item_widget.dart';
part '../widgets/home_recomended_product_widget.dart';
part '../widgets/home_tutorial_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorsConstant.neutral50,
        body: SafeArea(
      child: HomeContentWidget(),
    ));
  }
}
