import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greeve/global_widgets/global_button_widget.dart';
import 'package:greeve/routes/app_routes.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/images_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view/product/widgets/product_detail_image_widget.dart';
import 'package:greeve/view/product/widgets/product_detail_information_widget.dart';
import 'package:greeve/view_model/detail_product_controller.dart';
import 'package:loading_indicator/loading_indicator.dart';

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
            onPressed: () {
              Get.toNamed(AppRoutes.cart);
            },
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
                ProductDetailInformationWidget(controller: controller),
              ],
            ),
          ),
          Obx(
            () => Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {
                  controller.postCart();
                },
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
                    child: controller.isLoadingCartPost.value
                        ? Center(
                            child: SizedBox(
                              width: 50,
                              child: LoadingIndicator(
                                indicatorType: Indicator.ballBeat,
                                strokeWidth: 4.0,
                                colors: [
                                  Theme.of(context).secondaryHeaderColor
                                ],
                              ),
                            ),
                          )
                        : Text(
                            'Tambah ke keranjang',
                            style:
                                TextStylesConstant.nunitoButtonLarge.copyWith(
                              color: ColorsConstant.neutral200,
                            ),
                          ),
                  ),
                ),
              ),
            ),
          ),
          Obx(() {
            if (controller.showSuccessDialog.isTrue) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Get.dialog(
                  AlertDialog(
                    backgroundColor: ColorsConstant.neutral100,
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(ImagesConstant.addCartSuccess),
                        const SizedBox(height: 28),
                        Text(
                          'Yay! Barangmu berhasil dimasukkan ke keranjang.',
                          style: TextStylesConstant.nunitoHeading4,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    actions: [
                      GlobalButtonWidget(
                        text: 'Lanjut Checkout',
                        onTap: () {
                          Get.back();
                          Get.toNamed(AppRoutes.cart);
                        },
                      )
                    ],
                  ),
                );
                controller.showSuccessDialog.value = false;
              });
            }
            return const SizedBox.shrink();
          }),
        ],
      ),
    );
  }
}
