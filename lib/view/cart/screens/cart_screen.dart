import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view/cart/widgets/cart_item_card_widget.dart';
import 'package:greeve/view/cart/widgets/checkout_summary_widget.dart';
import 'package:greeve/view_model/cart_controller.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController controller = Get.put(CartController());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Keranjang',
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
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          itemCount: controller.cartItems.length,
          itemBuilder: (context, index) {
            var product = controller.cartItems[index];
            return CartItemCardWidget(
              name: product.name!,
              description: product.description!,
              image: product.image!,
              price: product.price!,
            );
          },
        ),
      ),
      bottomSheet: const CheckoutSummaryWidget(),
    );
  }
}
