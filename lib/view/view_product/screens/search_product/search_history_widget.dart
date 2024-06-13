import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';

class SearchHistoryWidget extends StatelessWidget {
  const SearchHistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Pencarian Terakhir',
                style: TextStylesConstant.nunitoSubtitle4,
              ),
              GestureDetector(
                onTap: () {
                  Get.dialog(
                    AlertDialog(
                      backgroundColor: ColorsConstant.neutral100,
                      title: Padding(
                        padding: const EdgeInsets.only(right: 20, left: 20),
                        child: Text(
                          'Hapus Riwayat Pencarian?',
                          style: TextStylesConstant.nunitoHeading4,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      content: Text(
                        'Kamu tidak akan bisa memulihkan ini. Jika Kamu menghapus riwayat pencarian, Kamu mungkin masih bisa melihat produk yang Kamu cari sebagai hasil yang di sarankan',
                        style: TextStylesConstant.nunitoSubtitle,
                        textAlign: TextAlign.center,
                      ),
                      actions: [
                        Row(
                          children: [
                            Expanded(
                              child: TextButton(
                                onPressed: () {
                                  Get.back();
                                },
                                style: TextButton.styleFrom(
                                  foregroundColor: ColorsConstant.primary500,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Text(
                                  'Tidak Sekarang',
                                  style: TextStylesConstant.nunitoSubtitle4
                                      .copyWith(
                                          color: ColorsConstant.primary500,
                                          fontSize: 15),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: TextButton(
                                onPressed: () {
                                  // logic delete
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: ColorsConstant.primary500,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Text(
                                  'Hapus Semua',
                                  style: TextStylesConstant.nunitoSubtitle4
                                      .copyWith(
                                          color: ColorsConstant.white,
                                          fontSize: 15),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
                child: Text(
                  'Hapus semua',
                  style: TextStylesConstant.nunitoSubtitle4.copyWith(
                    color: ColorsConstant.info500,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Piring',
                style: TextStylesConstant.nunitoSubtitle3
                    .copyWith(color: ColorsConstant.neutral900),
              ),
              const SizedBox(height: 8),
              Text(
                'Piring keren abiezz',
                style: TextStylesConstant.nunitoSubtitle3
                    .copyWith(color: ColorsConstant.neutral900),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
