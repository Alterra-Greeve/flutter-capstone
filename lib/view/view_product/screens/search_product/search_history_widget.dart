import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';

class SearchHistoryWidget extends StatelessWidget {
  const SearchHistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Pencarian Terakhir',
                style: TextStylesConstant.nunitoSubtitle2,
              ),
              GestureDetector(
                onTap: () {
                  Get.dialog(
                    AlertDialog(
                      title: const Text('Hapus Riwayat Pencarian'),
                      content: const Text(
                          'Apakah Anda ingin menghapus semua riwayat pencarian?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text('Tidak Sekarang'),
                        ),
                        TextButton(
                          onPressed: () {
                            // logic delete
                          },
                          child: const Text('Hapus Semua'),
                        ),
                      ],
                    ),
                  );
                },
                child: Text(
                  'Hapus Semua',
                  style: TextStylesConstant.nunitoSubtitle2
                      .copyWith(color: Colors.red),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        // logic history search
        Text(
          'Piring',
          style: TextStylesConstant.nunitoSubtitle2,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
