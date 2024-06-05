import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:greeve/global_widgets/global_bottom_navbar_widget.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view/view_product/screens/cart/cart_screen.dart';
import 'package:greeve/view/view_product/screens/search_product/search_screen.dart';
import 'package:greeve/view/view_product/screens/product/product_screens/widget/list_categories_product.dart';
import 'package:greeve/view/view_product/screens/product/product_screens/widget/list_horizontal_product.dart';
import 'package:greeve/view/view_product/screens/product/product_screens/widget/list_vertical_product.dart';
import 'package:greeve/view/view_product/screens/product/widget/carousel/banner_slider.dart';

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
        title: Text('Mau Beli apa hari ini ? ',
            style: TextStylesConstant.nunitoHeading3),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchScreen(),
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
                  builder: (context) => const CartScreen(),
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
            const BannerSlider(),
            const ListCategoriesProduct(),
            const ListHorizontalProduct(),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Rekomendasi Produk',
                    style: TextStylesConstant.nunitoHeading4,
                  ),
                ],
              ),
            ),
            const ListVerticalProduct(),
          ],
        ),
      ),
      bottomNavigationBar: const GlobalBottomNavbar(currentIndex: 2),
    );
  }
}
