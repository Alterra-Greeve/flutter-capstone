import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';

class GreeveScreen extends StatelessWidget {
  const GreeveScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    Text(
                      'History',
                      style: TextStylesConstant.nunitoSubtitle.copyWith(
                          fontWeight: FontWeight.w500,
                          color: ColorsConstant.primary500),
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
                          style: TextStylesConstant.nunitoFooter.copyWith(fontSize: 12),
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
                              '800', style: TextStylesConstant.nunitoSemiboldTitle,
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
                        onPressed: () {},
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
            const Row(
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(),
                )
              ],
            ),
            const Column(
              children: [
                SingleChildScrollView(
                  child: Column(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
