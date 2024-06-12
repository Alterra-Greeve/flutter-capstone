import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:greeve/global_widgets/global_button_widget.dart';
import 'package:greeve/global_widgets/global_form_button_widget.dart';
import 'package:greeve/global_widgets/global_text_field_widget.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view_model/cart_controller.dart';
import 'package:intl/intl.dart';

class CartItemCardWidget extends StatelessWidget {
  final CartController controller;
  final String? productId;
  final String? name;
  final String? description;
  final String? image;
  final String? price;
  final int qty;
  final VoidCallback onAdd;
  final VoidCallback onSubract;
  final VoidCallback onDelete;
  final VoidCallback onSet;
  const CartItemCardWidget({
    super.key,
    required this.controller,
    required this.productId,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.qty,
    required this.onAdd,
    required this.onSubract,
    required this.onDelete,
    required this.onSet,
  });

  @override
  Widget build(BuildContext context) {
    final formattedPrice =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0)
            .format(double.parse(price ?? '0'));
    return Dismissible(
      key: Key(productId!),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          onDelete();
        }
      },
      background: Container(
        height: 200,
        padding: const EdgeInsets.only(right: 16),
        decoration: const BoxDecoration(
            color: ColorsConstant.danger500,
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: const Align(
          alignment: Alignment.centerRight,
          child: Icon(Icons.delete),
        ),
      ),
      child: Container(
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
          border: Border.all(
            color: ColorsConstant.neutral200,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8)),
                  child: CachedNetworkImage(
                    imageUrl: image ?? "",
                    width: 70,
                    height: 70,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                const SizedBox(width: 16),
                SizedBox(
                  width: 180,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name ?? "",
                        style: TextStylesConstant.nunitoButtonSemibold,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        description ?? "",
                        style: TextStylesConstant.nunitoCaption.copyWith(
                          color: ColorsConstant.neutral600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        formattedPrice,
                        style: TextStylesConstant.nunitoSubtitle.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        if (qty > 1) {
                          onSubract();
                        } else {
                          Get.dialog(
                            AlertDialog(
                              backgroundColor: ColorsConstant.neutral100,
                              content: Text(
                                'Yay! Barangmu berhasil dimasukkan ke keranjang.',
                                style: TextStylesConstant.nunitoHeading4,
                                textAlign: TextAlign.center,
                              ),
                              actions: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: GlobalButtonWidget(
                                        text: 'Batalkan',
                                        buttonColor: ColorsConstant.neutral100,
                                        textColor: ColorsConstant.primary500,
                                        onTap: () {
                                          Get.back();
                                        },
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: GlobalButtonWidget(
                                        text: 'Hapus',
                                        onTap: () {
                                          onDelete();
                                          Get.back();
                                        },
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        }
                      },
                      child: Ink(
                        width: 24,
                        child: SvgPicture.asset(
                          IconsConstant.subtraction,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        controller.qtyErrorText = Rx<String?>(null);
                        controller.qtyController.text = qty.toString();
                        Get.dialog(
                          AlertDialog(
                            backgroundColor: ColorsConstant.neutral100,
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Masukkan jumlah produk',
                                  style: TextStylesConstant.nunitoHeading4,
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 28),
                                Obx(
                                  () => GlobalTextFieldWidget(
                                    textAlign: TextAlign.center,
                                    focusNode: controller.qtyFocusNode,
                                    controller: controller.qtyController,
                                    errorText: controller.qtyErrorText.value,
                                    onChanged: (value) =>
                                        controller.validateQty(value),
                                    showSuffixIcon: false,
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                              ],
                            ),
                            actions: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: GlobalButtonWidget(
                                      text: 'Batalkan',
                                      buttonColor: ColorsConstant.neutral100,
                                      textColor: ColorsConstant.primary500,
                                      onTap: () {
                                        Get.back();
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Obx(
                                      () => GlobalFormButtonWidget(
                                        isFormValid:
                                            controller.isFormValid.value,
                                        isLoading: false,
                                        text: 'Konfirmasi',
                                        onTap: () {
                                          if (controller.isFormValid.value) {
                                            onSet();
                                            Get.back();
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                      child: Ink(
                        width: 24,
                        child: Text(
                          textAlign: TextAlign.center,
                          qty.toString(),
                          style: TextStylesConstant.nunitoButtonSemibold,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: onAdd,
                      child: Ink(
                        width: 24,
                        child: SvgPicture.asset(IconsConstant.addition),
                      ),
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
                const SizedBox(height: 8),
              ],
            )
          ],
        ),
      ),
    );
  }
}
