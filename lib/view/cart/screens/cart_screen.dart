import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view/cart/widgets/cart_item_card_widget.dart';
import 'package:greeve/view/cart/widgets/checkout_summary_widget.dart';
import 'package:greeve/view/cart/widgets/empty_cart_widget.dart';
import 'package:greeve/view_model/cart_controller.dart';
import 'package:shimmer/shimmer.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController controller = Get.put(CartController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  itemCount: 5,
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
              : controller.cartData.isEmpty
                  ? const EmptyCartWidget()
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, bottom: 230),
                      itemCount: controller.cartData.length,
                      itemBuilder: (context, index) {
                        var item = controller.cartData[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: CartItemCardWidget(
                            controller: controller,
                            productId: item.product.productId,
                            name: item.product.name,
                            description: item.product.description,
                            image: item.product.images[0].imageUrl,
                            price: item.product.price.toString(),
                            qty: item.quantity,
                            onAdd: () => controller.incrementQuantity(item),
                            onSubract: () => controller.decrementQuantity(item),
                            onDelete: () => controller.deleteItem(item),
                            onSet: () => controller.setQuantity(
                              item,
                              int.tryParse(controller.qtyController.text)!,
                            ),
                          ),
                        );
                      },
                    ),
        ),
      ),
      bottomSheet: CheckoutSummaryWidget(controller: controller),
    );
  }
}
