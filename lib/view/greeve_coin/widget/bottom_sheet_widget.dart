import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';

class GreeveCoinBottomSheet extends StatelessWidget {
  const GreeveCoinBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: ColorsConstant.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              width: 60,
              child: Divider(
                thickness: 3,
                color: ColorsConstant.neutral600,
              ),
            ),
            Text(
              'Earn More Coins!',
              style: TextStylesConstant.nunitoHeading3,
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 70,
              width: double.infinity,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: ColorsConstant.primary500,
                    width: 1.5,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        IconsConstant.challenge,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Selesaikan Challenge',
                            style: TextStylesConstant.nunitoHeading4.copyWith(
                              color: ColorsConstant.primary500,
                            ),
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
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 70,
              width: double.infinity,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: ColorsConstant.primary500,
                    width: 1.5,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        IconsConstant.buyProduct,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Beli Beberapa Produk',
                            style: TextStylesConstant.nunitoHeading4.copyWith(
                              color: ColorsConstant.primary500,
                            ),
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
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 70,
              width: double.infinity,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: ColorsConstant.primary500,
                    width: 1.5,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        IconsConstant.winnerLeaderboard,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Jadilah Pemenang!',
                            style: TextStylesConstant.nunitoHeading4.copyWith(
                              color: ColorsConstant.primary500,
                            ),
                          ),
                          Text(
                            'Menjadi top 3 pada leaderboard',
                            style: TextStylesConstant.nunitoCaptioReguler,
                          ),
                        ],
                      )
                    ],
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
