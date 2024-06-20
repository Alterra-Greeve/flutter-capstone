import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greeve/routes/app_routes.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view_model/cart_controller.dart';
import 'package:intl/intl.dart';
import 'package:loading_indicator/loading_indicator.dart';

class CheckoutSummaryWidget extends StatelessWidget {
  final CartController controller;
  const CheckoutSummaryWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.cartData.isEmpty
        ? const SizedBox(width: 0, height: 0)
        : Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Get.toNamed(AppRoutes.greeveCoin);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(IconsConstant.voucherOff),
                            const SizedBox(width: 11),
                            Text(
                              'Gunakan Voucher Greeve',
                              style: TextStylesConstant.nunitoSubtitle,
                            )
                          ],
                        ),
                        SvgPicture.asset(IconsConstant.right),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(IconsConstant.coin),
                          const SizedBox(width: 11),
                          Text(
                            'Tukarkan Koin',
                            style: TextStylesConstant.nunitoSubtitle.copyWith(
                              color: ColorsConstant.neutral500,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Obx(
                            () {
                              final formattedCoin = NumberFormat.currency(
                                locale: 'id_ID',
                                symbol: 'Rp ',
                                decimalDigits: 0,
                              ).format(controller.coinData.value);
                              return Text(
                                '[-$formattedCoin]',
                                style:
                                    TextStylesConstant.nunitoSubtitle.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: controller.useCoin.value
                                      ? ColorsConstant.black
                                      : ColorsConstant.neutral500,
                                ),
                              );
                            },
                          ),
                          const SizedBox(width: 16),
                          Obx(
                            () => SizedBox(
                              width: 28,
                              child: Transform.scale(
                                scale: 0.6,
                                child: Switch(
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  value: controller.useCoin.value,
                                  onChanged: (value) {
                                    controller.toggleCoinSwitch();
                                  },
                                  activeTrackColor: ColorsConstant.primary100,
                                  activeColor: ColorsConstant.primary500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const Divider(),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total:',
                        style: TextStylesConstant.nunitoSubtitle.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Obx(
                        () {
                          final formattedTotalPrice = NumberFormat.currency(
                            locale: 'id_ID',
                            symbol: 'Rp ',
                            decimalDigits: 0,
                          ).format(controller.totalPrice.value);
                          return Text(
                            formattedTotalPrice,
                            style: TextStylesConstant.nunitoSubtitle.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {
                      controller.postTransaction();
                    },
                    child: Container(
                      width: double.infinity,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: ColorsConstant.primary500,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: Center(
                        child: controller.isLoadingTransaction.value
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
                                'Lanjut Checkout',
                                style: TextStylesConstant.nunitoButtonLarge
                                    .copyWith(
                                  color: ColorsConstant.neutral100,
                                ),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ));
  }
}
