import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:greeve/global_widgets/global_bottom_navbar_widget.dart';
import 'package:greeve/models/api_responses/product_model.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view/view_product/screens/cart/cart_screen.dart';
import 'package:greeve/view/view_product/screens/search_product/search_screen.dart';
import 'package:greeve/view/view_product/screens/product/all_product/all_product_screen.dart';
import 'package:greeve/view/view_product/screens/product/product_screens/widget/list_categories_product.dart';
import 'package:greeve/view/view_product/screens/product/product_screens/widget/list_horizontal_product.dart';
import 'package:greeve/view/view_product/screens/product/product_screens/widget/list_vertical_product.dart';
import 'package:greeve/view/view_product/screens/product/widget/carousel/banner_slider.dart';
import 'package:greeve/view/view_product/screens/product/widget/carousel/image_carousel.dart';
import 'package:greeve/view/view_product/screens/product/widget/carousel/image_viewer.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mau Beli apa hari ini ? '),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchScreen(),
                ),
              );
            },
            icon: SvgPicture.asset(IconsConstant.search),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartScreen(),
                ),
              );
            },
            icon: SvgPicture.asset(IconsConstant.bag),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BannerSlider(),
            ListCategoriesProduct(),
            ListHorizontalProduct(),
            ListVerticalProduct(),
            Text(' Rekomendasi Produk'),
          ],
        ),
      ),
      bottomNavigationBar: GlobalBottomNavbar(currentIndex: 2),
    );
  }
}
