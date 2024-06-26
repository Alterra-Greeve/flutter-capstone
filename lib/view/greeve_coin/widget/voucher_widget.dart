import 'package:flutter/material.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/view_model/greeve_coin_controller.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';

class VoucherWidget extends StatelessWidget {
  final GreeveCoinController controller;
  final String idVoucher;
  final String name;
  final String discount;
  final int used;
  final int index;
  final String code;

  const VoucherWidget({
    super.key,
    required this.controller,
    required this.idVoucher,
    required this.discount,
    required this.name,
    required this.used,
    required this.index,
    required this.code,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Stack(
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: ColorsConstant.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: ColorsConstant.black.withOpacity(0.15),
                        spreadRadius: 0.5,
                      ),
                    ],
                  ),
                  child: const SizedBox(
                    height: 165,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: Image.asset(
                      controller.getImageVoucherForIndex(index),
                      height: 107,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: ColorsConstant.avatarVoucher,
                                  child: Text(
                                    controller.getInitials(name),
                                    style: TextStylesConstant.nunitoHeading3
                                        .copyWith(
                                            color: ColorsConstant.primary500),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Flexible(
                                  child: Text(
                                    name,
                                    maxLines: 2,
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStylesConstant
                                        .nunitoButtonSemibold
                                        .copyWith(
                                      color: ColorsConstant.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 50,
                                      child: VerticalDivider(
                                        thickness: 2,
                                        color: controller
                                            .getColorDividerVoucher(index),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 80,
                                  child: Text(
                                    discount,
                                    style: TextStylesConstant.nunitoHeading1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 9),
                                child: Text(
                                  used != 0 ? '${used}0% Sold' : '$used% Sold',
                                  style:
                                      TextStylesConstant.nunitoFooter.copyWith(
                                    fontSize: 12,
                                    color: ColorsConstant.primary500,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              LinearPercentIndicator(
                                width: 230,
                                animation: true,
                                lineHeight: 5.0,
                                animationDuration: 2000,
                                percent: used / 10,
                                barRadius: const Radius.circular(10),
                                progressColor: Colors.green,
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 9),
                            child: ElevatedButton(
                              style: TextButton.styleFrom(
                                backgroundColor: ColorsConstant.primary500,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () {
                                controller.navigateToCart(
                                  code,
                                  discount,
                                );
                              },
                              child: Text(
                                'Pakai',
                                style:
                                    TextStylesConstant.nunitoSubtitle4.copyWith(
                                  color: ColorsConstant.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
