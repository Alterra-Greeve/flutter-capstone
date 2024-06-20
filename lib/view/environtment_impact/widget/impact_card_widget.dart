import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/images_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view/environtment_impact/screen/detail_impact_screen.dart';

class ImpactCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 4,
      itemBuilder: (context, index) {
        String imagePath;
        String title;
        String subtitle;

        switch (index) {
          case 0:
            imagePath = ImagesConstant.hemat;
            title = 'Hemat Uang';
            subtitle = 'Dampak yang sudah dilakukan 40%';
            break;
          case 1:
            imagePath = ImagesConstant.totebag;
            title = 'Mengurangi Limbah';
            subtitle = 'Dampak yang sudah dilakukan 40%';
            break;
          case 2:
            imagePath = ImagesConstant.knowledge;
            title = 'Perluas Wawasan';
            subtitle = 'Dampak yang sudah dilakukan 40%';
            break;
          case 3:
            imagePath = ImagesConstant.globalWarming;
            title = 'Mengurangi Pemanasan Global';
            subtitle = 'Dampak yang sudah dilakukan 40%';
            break;
          default:
            return SizedBox.shrink();
        }

        return Column(
          children: [
            GestureDetector(
              onTap: () {
                Get.to(() => DetailImpactScreen());
              },
              child: _buildImageAndTitleContainer(imagePath, title, subtitle),
            ),
            SizedBox(height: 8),
          ],
        );
      },
    );
  }

  Widget _buildImageAndTitleContainer(
      String imagePath, String title, String subtitle) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: ColorsConstant.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: ColorsConstant.neutral200, width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: ColorsConstant.primary400,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Image.asset(
                imagePath,
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStylesConstant.nunitoButtonSemibold
                      .copyWith(color: ColorsConstant.neutral900),
                ),
                SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStylesConstant.nunitoCaption
                      .copyWith(color: ColorsConstant.neutral600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
