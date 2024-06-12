import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view/cart/widgets/cart_item_card_widget.dart';
import 'package:greeve/view/cart/widgets/checkout_summary_widget.dart';
import 'package:greeve/view_model/cart_controller.dart';
import 'package:shimmer/shimmer.dart';

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
        child: Obx(
          () => controller.isLoadingCart.value
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: 4,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemBuilder: (context, index) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade200,
                      child: Container(
                        width: double.infinity,
                        height: 70,
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    );
                  },
                )
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  itemCount: controller.cartData.length,
                  itemBuilder: (context, index) {
                    var item = controller.cartData[index];
                    return CartItemCardWidget(
                      name: item.product.name,
                      description: item.product.description,
                      image: item.product.images[0].imageUrl,
                      price: item.product.price.toString(),
                    );
                  },
                ),
        ),
      ),
      bottomSheet: CheckoutSummaryWidget(controller: controller),
    );
  }
}
