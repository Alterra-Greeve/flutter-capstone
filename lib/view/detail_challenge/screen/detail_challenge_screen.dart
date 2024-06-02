import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../view_model/detail_challenge_controller.dart';
import '../widget/detail_challenge_arrow_back_widget.dart';
import '../widget/detail_challenge_header_widget.dart';
import '../widget/detail_challenge_time_widget.dart';
import '../widget/detail_challenge_upload_button_widget.dart';
import '../widget/point_card_widget.dart';

class DetailChallengeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailChallengeController>(
      init: DetailChallengeController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsConstant.primary500,
          body: SingleChildScrollView(
            child: Column(
              children: [
                const Stack(
                  children: [
                    DetailChallengeHeaderWidget(),
                    DetailChallengeArrowBackWidget(),
                    DetailChallengeTimeWidget(),
                    Positioned(
                      bottom: -30,
                      left: 16,
                      right: 16,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          PointCardWidget(
                              image: IconsConstant.poinXp,
                              points: '50',
                              color: ColorsConstant.danger500),
                          PointCardWidget(
                              image: IconsConstant.yellowCoin,
                              points: '20',
                              color: ColorsConstant.warning500),
                          PointCardWidget(
                              image: IconsConstant.impact,
                              points: '2',
                              color: ColorsConstant.success500),
                        ],
                      ),
                    ),
                  ],
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ContentContainer(controller),
                    const Positioned(
                      bottom: -30,
                      left: 16,
                      right: 16,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          PointCardWidget(
                              image: IconsConstant.poinXp,
                              points: '50',
                              color: ColorsConstant.danger500),
                          PointCardWidget(
                              image: IconsConstant.yellowCoin,
                              points: '20',
                              color: ColorsConstant.warning500),
                          PointCardWidget(
                              image: IconsConstant.impact,
                              points: '2',
                              color: ColorsConstant.success500),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget ContentContainer(DetailChallengeController controller) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
      decoration: const BoxDecoration(
        color: ColorsConstant.neutral50,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text('Easy',
                    style: TextStylesConstant.nunitoCaptionBold
                        .copyWith(color: ColorsConstant.success600)),
              ),
              Row(
                children: [
                  SvgPicture.asset(IconsConstant.threeUser, width: 24),
                  const SizedBox(width: 4),
                  RichText(
                      text: TextSpan(
                    text: '100',
                    style: TextStylesConstant.nunitoExtraBoldFooter
                        .copyWith(color: ColorsConstant.neutral900),
                    children: [
                      TextSpan(
                        text: ' orang sedang melakukannya',
                        style: TextStylesConstant.nunitoCaption
                            .copyWith(color: ColorsConstant.neutral900),
                      ),
                    ],
                  )),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text('Aku Cinta Tote Bag',
              style: TextStylesConstant.nunitoHeading4.copyWith(
                color: ColorsConstant.neutral900,
              )),
          const SizedBox(height: 8),
          Row(
            children: [
              Text('Membantu', style: TextStylesConstant.nunitoButtonSemibold),
              const SizedBox(width: 8),
              Container(
                child: SvgPicture.asset(IconsConstant.helpCoin),
              ),
              const SizedBox(width: 8),
              Container(
                child: SvgPicture.asset(IconsConstant.helpEarth),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Dengan menggunakan tote bag, masyarakat dapat mengurangi jumlah sampah plastik yang berkontribusi pada penurunan polusi dan kerusakan ekosistem.',
            style: TextStylesConstant.nunitoCaption,
          ),
          const SizedBox(height: 16),
          Text('Unggah Bukti', style: TextStylesConstant.nunitoButtonSemibold),
          const SizedBox(height: 8),
          Obx(() => Row(
                children: List.generate(4, (index) {
                  return index < controller.photos.length
                      ? _buildPhotoBox(index, controller)
                      : _buildUploadBox(index, controller);
                }),
              )),
          const SizedBox(height: 16),
          DetailChallengeUploadButtonWidget(controller: controller),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Obx(
                () => controller.isUploaded.value
                    ? GestureDetector(
                        onTap: () {
                          controller.isUploaded.value =
                              !controller.isUploaded.value;
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.green[100],
                            borderRadius: BorderRadius.circular(60),
                            border: Border.all(
                                width: 2,
                                color: Colors.green,
                                style: BorderStyle.values[1]),
                          ),
                          width: 25,
                          height: 25,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(60),
                                  border: Border.all(
                                      width: 2,
                                      color: Colors.green,
                                      style: BorderStyle.values[1]),
                                ),
                                width: 15,
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          controller.isUploaded.value =
                              !controller.isUploaded.value;
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(60),
                            border: Border.all(
                                width: 2,
                                color: Colors.green,
                                style: BorderStyle.values[1]),
                          ),
                          width: 25,
                          height: 25,
                        ),
                      ),
              ),
              const SizedBox(width: 8),
              const Text('Pengunggahan telah selesai',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w500)),
            ],
          ),
          const SizedBox(height: 16),
          Obx(
            () => controller.isUploaded.value
                ? GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 3, 68, 21),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      width: double.infinity,
                      height: 70,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Saya ingin menyelesaikannya',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                  )
                : GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      width: double.infinity,
                      height: 70,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Saya ingin menyelesaikannya',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                  ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildUploadBox(int index, DetailChallengeController controller) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          controller.addPhoto();
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 100,
          decoration: BoxDecoration(
            color: ColorsConstant.neutral400,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Obx(() => controller.photos.length == index
              ? SvgPicture.asset(IconsConstant.imageBreak)
              : Container()),
        ),
      ),
    );
  }

  Widget _buildPhotoBox(int index, DetailChallengeController controller) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          controller.removePhoto(index);
        },
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(color: ColorsConstant.neutral200),
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: FileImage(File(controller.photos[index].path)),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 5,
              right: 5,
              child: Container(
                decoration: const BoxDecoration(
                  color: ColorsConstant.danger500,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.close,
                  color: ColorsConstant.white,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
