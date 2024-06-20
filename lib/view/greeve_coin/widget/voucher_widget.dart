import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/images_constant.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';

class VoucherWidget extends StatelessWidget {
  const VoucherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
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
                    ImagesConstant.greenVoucher,
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
                        Row(
                          children: [
                            SvgPicture.asset(ImagesConstant.voucherSedotan),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Voucher Diskon\nPaper Bag',
                              style: TextStylesConstant.nunitoButtonSemibold
                                  .copyWith(
                                color: ColorsConstant.white,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Column(
                              children: [
                                SizedBox(
                                  height: 50,
                                  child: VerticalDivider(
                                    thickness: 2,
                                    color: ColorsConstant.success500,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '20%',
                              style: TextStylesConstant.nunitoHeading1,
                            ),
                          ],
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
                                '0% Sold',
                                style: TextStylesConstant.nunitoFooter.copyWith(
                                  fontSize: 12,
                                  color: ColorsConstant.primary500,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            LinearPercentIndicator(
                              width: 240,
                              animation: true,
                              lineHeight: 5.0,
                              animationDuration: 2000,
                              percent: 0.01,
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
                            onPressed: () {},
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
        ],
      ),
    );
  }
}
