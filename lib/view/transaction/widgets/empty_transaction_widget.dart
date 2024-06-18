import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greeve/global_widgets/global_button_widget.dart';
import 'package:greeve/routes/app_routes.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/images_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';

class EmptyTransactionWidget extends StatelessWidget {
  const EmptyTransactionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            SvgPicture.asset(ImagesConstant.emptyCart),
            const SizedBox(height: 20),
            Text(
              'Daftar transaksi belum terisi',
              style: TextStylesConstant.nunitoButtonBold,
            ),
            const SizedBox(height: 4),
            Text(
              textAlign: TextAlign.center,
              'Yuk, telusuri berbagai produk dan penawaran menarik di Greeve!',
              style: TextStylesConstant.nunitoSubtitle.copyWith(
                fontWeight: FontWeight.w500,
                color: ColorsConstant.neutral500,
              ),
            ),
            const SizedBox(height: 20),
            GlobalButtonWidget(
              text: 'Mulai Belanja',
              onTap: () {
                Get.offAllNamed(AppRoutes.bottomNavigation);
              },
            ),
          ],
        ),
      ),
    );
  }
}
