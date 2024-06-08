import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/constants/icons_constant.dart';

class DetailChallengeController extends GetxController {
  final count = 0.obs;
  
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  var photos = <XFile>[].obs;
  RxBool isUploaded = false.obs;

  void addPhoto() async {
    if (photos.length < 4) {
      final ImagePicker picker = ImagePicker();
      Get.bottomSheet(
        Container(
          height: 200,
          decoration: const BoxDecoration(
            color: ColorsConstant.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //close button
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Positioned(
                      top: 10,
                      right: 10,
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: const Icon(
                            Icons.close,
                            color: ColorsConstant.white,
                          ),
                          decoration: BoxDecoration(
                            color: ColorsConstant.danger500,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Text('Pilih sumber gambar',
                    style: TextStylesConstant.nunitoButtonSemibold),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          final XFile? photo = await picker.pickImage(
                              source: ImageSource.camera);
                          if (photo != null) {
                            photos.add(photo);
                          }
                          Get.back();
                        },
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SvgPicture.asset(IconsConstant.camera),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Foto',
                                style: TextStylesConstant.nunitoButtonLarge,
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          final XFile? photo = await picker.pickImage(
                              source: ImageSource.gallery);
                          if (photo != null) {
                            photos.add(photo);
                          }
                          Get.back();
                        },
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SvgPicture.asset(IconsConstant.gallery),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Galeri',
                                style: TextStylesConstant.nunitoButtonLarge,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                const SizedBox(
                  height: 10,
                ),
              ]),
        ),
      );
    }
  }

  void removePhoto(int index) {
    if (index >= 0 && index < photos.length) {
      photos.removeAt(index);
    }
  }
}

class DetailControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailChallengeController>(
      () => DetailChallengeController(),
    );
  }
}
