import 'package:flutter/material.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';

class ProductDetailInformationWidget extends StatelessWidget {
  const ProductDetailInformationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tumbler',
                style: TextStylesConstant.nunitoSemiboldTitle,
              ),
              Row(
                children: [
                  Text(
                    'Rp 148.500',
                    style: TextStylesConstant.nunitoCaption.copyWith(
                        fontSize: 10,
                        color: ColorsConstant.danger500,
                        decoration: TextDecoration.lineThrough,
                        decorationColor: ColorsConstant.danger500),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Rp 148.500',
                    style: TextStylesConstant.nunitoSubtitle3,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Bahan: Stainless steel 304\n'
            'Kapasitas: 500 ml (17 oz)\n'
            'Dimensi: 23 cm x 7 cm (tinggi x diameter)\n'
            'Berat: 300 gram\n'
            'Warna: Silver, Biru, Hijau, Pink',
            style: TextStylesConstant.nunitoCaption,
          ),
          const SizedBox(height: 16),
          Text(
            'Tumbler Ramah Lingkungan adalah pilihan sempurna bagi mereka yang ingin mengurangi dampak lingkungan mereka. Terbuat dari stainless steel 304 yang tahan lama dan aman untuk digunakan, tumbler ini dapat digunakan kembali berkali-kali, sehingga menghilangkan kebutuhan akan botol plastik sekali pakai.',
            style: TextStylesConstant.nunitoCaption.copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Membantu',
            style: TextStylesConstant.nunitoButtonSemibold,
          ),
          const SizedBox(height: 8),
          Container(
            width: 48,
            height: 48,
            decoration: const BoxDecoration(
              color: ColorsConstant.neutral100,
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Ukuran',
            style: TextStylesConstant.nunitoButtonSemibold,
          ),
          Container(
            width: 48,
            height: 48,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  ColorsConstant.primary400,
                  ColorsConstant.primary500,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: Center(
              child: Text(
                'S',
                style: TextStylesConstant.nunitoButtonSemibold.copyWith(
                  color: ColorsConstant.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
