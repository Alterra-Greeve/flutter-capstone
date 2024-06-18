import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/images_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 64,
        title: Text(
          'Notifikasi',
          style: TextStylesConstant.nunitoButtonSemibold,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: SvgPicture.asset(IconsConstant.arrow),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Center(
                child: SvgPicture.asset(
                  ImagesConstant.emptyStateNoData,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Belum ada notifikasi yang masuk untuk saat ini',
                style: TextStylesConstant.nunitoHeading4,
              )
            ],
          ),
        ),
      ),
    );
  }
}
