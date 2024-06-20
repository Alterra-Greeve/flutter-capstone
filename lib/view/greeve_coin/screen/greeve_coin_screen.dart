import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/images_constant.dart';
import 'package:greeve/view_model/greeve_coin_controller.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view/greeve_coin/widget/voucher_widget.dart';

class GreeveScreen extends StatelessWidget {
  const GreeveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GreeveCoinController controller = Get.put(GreeveCoinController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Koin Saya & Voucher',
          style: TextStylesConstant.nunitoSubtitle4,
        ),
        leading: IconButton(
          icon: SvgPicture.asset(IconsConstant.arrow),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        toolbarHeight: 56,
        scrolledUnderElevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Greeve Coin',
                      style: TextStylesConstant.nunitoHeading3,
                    ),
                    GestureDetector(
                      onTap: (){
                        controller.navigateToAllHistoryCoin();
                      },
                      child: Text(
                        'History',
                        style: TextStylesConstant.nunitoSubtitle.copyWith(
                            fontWeight: FontWeight.w500,
                            color: ColorsConstant.primary500),
                      ),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                color: ColorsConstant.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: ColorsConstant.black.withOpacity(0.15),
                    spreadRadius: 0.5,
                    blurRadius: 3,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Lee John Doe',
                          style: TextStylesConstant.nunitoSemiboldTitle,
                        ),
                        Text(
                          'Greeve Coin',
                          style: TextStylesConstant.nunitoFooter
                              .copyWith(fontSize: 12),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              IconsConstant.profile,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Text(
                              'ID 19210024',
                              style: TextStylesConstant.nunitoReguler,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SvgPicture.asset(
                              IconsConstant.coin,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Text(
                              '800',
                              style: TextStylesConstant.nunitoSemiboldTitle,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      height: 42,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: TextButton.styleFrom(
                          backgroundColor: ColorsConstant.primary500,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          controller.navigateToBottomSheet();
                        },
                        child: Text(
                          'Dapatkan Lebih Banyak Koin!',
                          style: TextStylesConstant.nunitoSubtitle4.copyWith(
                              color: ColorsConstant.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: (){
                    controller.navigateToAllVoucher();
                  },
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
                              blurRadius: 3,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const SizedBox(
                          width: 180,
                          height: 75,
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: SvgPicture.asset(
                            ImagesConstant.allVoucher,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 7,
                        left: 7,
                        child: Text(
                          'Cari Semua\nVoucher',
                          style: TextStylesConstant.nunitoCaptionBold
                              .copyWith(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 15),
                GestureDetector(
                  onTap: (){
                    controller.navigateToGetCoin();
                  },
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
                              blurRadius: 3,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const SizedBox(
                          width: 180,
                          height: 75,
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: SvgPicture.asset(
                            ImagesConstant.getCoin,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 7,
                        left: 7,
                        child: Text(
                          'Cara Dapat\nGreeve Coin',
                          style: TextStylesConstant.nunitoCaptionBold
                              .copyWith(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Voucher Discount',
                  style: TextStylesConstant.nunitoHeading3,
                ),
                const SizedBox(height: 10),
                const VoucherWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
