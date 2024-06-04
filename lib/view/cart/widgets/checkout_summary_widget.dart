import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';

class CheckoutSummaryWidget extends StatelessWidget {
  const CheckoutSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            Row(
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
                    Text(
                      '-Rp 5',
                      style: TextStylesConstant.nunitoSubtitle.copyWith(
                        fontWeight: FontWeight.w600,
                        color: ColorsConstant.neutral500,
                      ),
                    ),
                    const SizedBox(width: 16),
                    SizedBox(
                      width: 28,
                      child: Transform.scale(
                        scale: 0.6,
                        child: Switch(
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          value: true,
                          onChanged: (value) {},
                          activeTrackColor: ColorsConstant.primary100,
                          activeColor: ColorsConstant.primary500,
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
                Text(
                  'Rp 218.400',
                  style: TextStylesConstant.nunitoSubtitle.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              height: 40,
              decoration: const BoxDecoration(
                color: ColorsConstant.primary500,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: Center(
                child: Text(
                  'Lanjut Checkout',
                  style: TextStylesConstant.nunitoButtonLarge.copyWith(
                    color: ColorsConstant.neutral100,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}