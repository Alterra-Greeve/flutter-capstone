import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greeve/global_widgets/global_button_widget.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/images_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 64,
        title: Text(
          'Pusat Bantuan',
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
              Center(child: Image.asset(ImagesConstant.customerServiceImage)),
              const SizedBox(height: 8),
              Text(
                'Hi, Saya CS',
                style: TextStylesConstant.nunitoSubtitle4.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'PUNYA PERTANYAAN?',
                style: TextStylesConstant.nunitoButtonSemibold,
              ),
              const SizedBox(height: 12),
              Text(
                'Ayo tanyakan saja jika ada pertanyaan, CS akan membantumu',
                style: TextStylesConstant.nunitoButtonLarge.copyWith(
                  color: ColorsConstant.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 40),
              Center(
                child: GlobalButtonWidget(
                  text: 'Chat dengan CS',
                  onTap: () {},
                  buttonWidth: 232,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
