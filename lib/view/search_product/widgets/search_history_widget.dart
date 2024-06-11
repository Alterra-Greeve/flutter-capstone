import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:greeve/view_model/search_controller.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/images_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';

class SearchHistoryWidget extends StatelessWidget {
  final Function(String) onItemClick;
  const SearchHistoryWidget({super.key, required this.onItemClick});

  @override
  Widget build(BuildContext context) {
    final searchProductController = Get.find<SearchProductController>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 3),
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
                                  searchProductController.deleteAllHistory();
                                  Get.back();
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
        const SizedBox(height: 13),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: searchProductController.historySearch.map(
                        (e) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 13),
                            child: GestureDetector(
                              onTap: () {
                                onItemClick(e);
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    e,
                                    style: TextStylesConstant.nunitoSubtitle3
                                        .copyWith(
                                      fontSize: 15,
                                      color: ColorsConstant.neutral900,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      searchProductController
                                          .deleteHistoryItem(e);
                                    },
                                    child: SvgPicture.asset(
                                      ImagesConstant.closeSquare,
                                      width: 22,
                                      height: 22,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
