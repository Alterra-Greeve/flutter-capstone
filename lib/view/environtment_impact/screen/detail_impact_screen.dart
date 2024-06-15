import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greeve/utils/constants/colors_constant.dart';

import '../../../utils/constants/icons_constant.dart';
import '../../../utils/constants/images_constant.dart';
import '../../../utils/constants/text_styles_constant.dart';

class DetailImpactScreen extends StatelessWidget {
  const DetailImpactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Hemat Uang',
            style: TextStylesConstant.nunitoButtonBold,
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: SvgPicture.asset(IconsConstant.arrow),
          ),
          toolbarHeight: 64,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  width: double.maxFinite,
                  height: 216,
                  child: Image.asset(
                    ImagesConstant.hemat,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 42,
                      height: 42,
                      child: SvgPicture.asset(IconsConstant.coin),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dampak',
                            style: TextStylesConstant.nunitoFooter.copyWith(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            'Hemat Uang',
                            style: TextStylesConstant.nunitoCaption.copyWith(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                LinearProgressIndicator(
                  value:
                      0.7, // Ubah nilai ini sesuai dengan progress yang diinginkan
                  backgroundColor: Colors.grey.shade200,
                  valueColor:
                      AlwaysStoppedAnimation<Color>(ColorsConstant.primary800),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '40/100',
                    style: TextStylesConstant.nunitoCaption.copyWith(
                      fontSize: 14,
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Hemat Uang',
                    style: TextStylesConstant.nunitoCaption.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Save Money atau Hemat Uang adalah konsep yang mendorong individu untuk mengelola keuangan mereka dengan bijak. Ini melibatkan praktik-praktik seperti mengurangi pengeluaran yang tidak perlu, mencari cara untuk mendapatkan nilai lebih dari setiap pembelian, dan memaksimalkan efisiensi dalam penggunaan sumber daya. Dengan menghemat uang, individu dapat mencapai stabilitas finansial dan lebih mampu menghadapi situasi darurat atau merencanakan masa depan dengan lebih baik.\n\nContoh Dampak Positif Save Money pada Lingkungan: \n - Mengurangi emisi gas rumah kaca dari produksi dan transportasi barang \n - Menghemat sumber daya alam seperti air, kayu, dan energi\n - Mengurangi polusi udara dan air dari limbah industri dan rumah tangga',
                    style: TextStylesConstant.nunitoCaption.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}