import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/view_model/greeve_coin_controller.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view/greeve_coin/widget/how_to_get_coin_carousel_widget.dart';

class GetCoinScreen extends StatelessWidget {
  const GetCoinScreen({super.key});

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
          icon: SvgPicture.asset(
            IconsConstant.arrow,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        toolbarHeight: 56,
        scrolledUnderElevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GetCoinCarouselWidget(controller: controller),
                const SizedBox(height: 20),
                Text(
                  'Cara Mendapatkan Greeve Coin?',
                  style: TextStylesConstant.nunitoHeading4,
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 70,
                  width: double.infinity,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: ColorsConstant.neutral200,
                        width: 1.5,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            const SizedBox(
                              height: 70,
                              width: 70,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(6),
                                    topLeft: Radius.circular(6),
                                  ),
                                  color: ColorsConstant.primary500,
                                ),
                              ),
                            ),
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment.center,
                                child: SvgPicture.asset(
                                  IconsConstant.challenge,
                                  height: 60,
                                  width: 60,
                                  colorFilter: const ColorFilter.mode(
                                    ColorsConstant.white,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Selesaikan Challenge',
                              style: TextStylesConstant.nunitoHeading4,
                            ),
                            Text(
                              'Selesaikan challenge tiap harinya',
                              style: TextStylesConstant.nunitoCaptioReguler,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 70,
                  width: double.infinity,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: ColorsConstant.neutral200,
                        width: 1.5,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            const SizedBox(
                              height: 70,
                              width: 70,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(6),
                                    topLeft: Radius.circular(6),
                                  ),
                                  color: ColorsConstant.primary500,
                                ),
                              ),
                            ),
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment.center,
                                child: SvgPicture.asset(
                                  IconsConstant.buyProduct,
                                  height: 60,
                                  width: 60,
                                  colorFilter: const ColorFilter.mode(
                                    ColorsConstant.white,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Beli Beberapa Produk',
                              style: TextStylesConstant.nunitoHeading4,
                            ),
                            Text(
                              'Dapatkan koin sesuai produk yang anda beli',
                              style: TextStylesConstant.nunitoCaptioReguler,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 70,
                  width: double.infinity,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: ColorsConstant.neutral200,
                        width: 1.5,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            const SizedBox(
                              height: 70,
                              width: 70,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(6),
                                    topLeft: Radius.circular(6),
                                  ),
                                  color: ColorsConstant.primary500,
                                ),
                              ),
                            ),
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment.center,
                                child: SvgPicture.asset(
                                  IconsConstant.winnerLeaderboard,
                                  height: 60,
                                  width: 60,
                                  colorFilter: const ColorFilter.mode(
                                    ColorsConstant.white,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 15),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Jadilah Pemenang!',
                              style: TextStylesConstant.nunitoHeading4,
                            ),
                            Text(
                              'Menjadi top 3 pada leaderboard',
                              style: TextStylesConstant.nunitoCaptioReguler,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
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
                  
                },
                child: Text(
                  'Jelajahi Sekarang!',
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
    );
  }
}
