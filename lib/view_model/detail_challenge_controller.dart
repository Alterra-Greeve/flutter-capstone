import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greeve/services/api/api_challenge_service.dart';
import 'package:greeve/services/shared_pref/shared_pref.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view/detail_challenge/widget/detail_challenge_dialog_widget.dart';
import 'package:greeve/view_model/home_controller.dart';
import 'package:greeve/view_model/list_challenge_controller.dart';
import 'package:image_picker/image_picker.dart';
import 'package:greeve/models/api_responses/challenge_response_model.dart';
import '../utils/constants/icons_constant.dart';

class DetailChallengeController extends GetxController {
  final ApiChallengeService _apiService = ApiChallengeService();
  Rx<bool> isLoadingDetailChallenge = Rx<bool>(false);
  Rx<bool> isLoadingUpdateChallenge = Rx<bool>(false);
  Rx<String?> errorMessage = Rx<String?>(null);
  Rx<Data?> challengeData = Rx<Data?>(null);
  RxList<String> impactCategories = <String>[].obs;
  var photos = <XFile>[].obs;
  RxList<String> photosBase64 = <String>[].obs;
  Rx<bool> isUploaded = Rx<bool>(false);
  Rx<int> totalImpactPoint = Rx<int>(0);

  @override
  void onInit() {
    getChallenge();
    super.onInit();
  }

  void getChallenge() async {
    try {
      final String challengeId = Get.arguments;
      final String? token = await SharedPreferencesManager.getToken();
      challengeData.value = null;
      isLoadingDetailChallenge.value = true;
      final result = await _apiService.getChallenge(token, challengeId);
      challengeData.value = result.data;
      int totalImpact =
          result.data.challenge.categories.fold(0, (sum, category) {
        return sum + category.impactCategory.impactPoint;
      });
      totalImpactPoint.value = totalImpact;
      impactCategories.value = result.data.challenge.categories.map((category) {
        return category.impactCategory.name;
      }).toList();
      errorMessage.value = '';
    } catch (e) {
      errorMessage.value = e.toString();
      Get.snackbar(
        'Error',
        errorMessage.value ?? '',
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
      );
    } finally {
      isLoadingDetailChallenge.value = false;
    }
  }

  void updateChallengesParticipate() async {
    try {
      final String challengeId = Get.arguments;
      final String? token = await SharedPreferencesManager.getToken();
      isLoadingUpdateChallenge.value = true;
      await _apiService.updateChallengesParticipate(
          token,
          [
            "https://www.example.com/challenge-1.jpg",
            "https://www.example.com/challenge-2.jpg"
          ],
          challengeId);
      photos.clear();
      photosBase64.clear();
      isUploaded.value = false;
      errorMessage.value = '';
      Get.find<HomeController>().getUserProfile();
      Get.find<ListChallengeController>().getChallenges();
      showUpdateChallengeSuccessDialog();
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoadingUpdateChallenge.value = false;
    }
  }

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
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          color: ColorsConstant.danger500,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.close,
                          color: ColorsConstant.white,
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
                        final XFile? photo =
                            await picker.pickImage(source: ImageSource.camera);
                        if (photo != null) {
                          final bytes = await File(photo.path).readAsBytes();
                          final base64String = base64Encode(bytes);
                          photos.add(photo);
                          photosBase64.add(base64String);
                          isUploaded.value = true;
                        }
                        Get.back();
                      },
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
                    GestureDetector(
                      onTap: () async {
                        final XFile? photo =
                            await picker.pickImage(source: ImageSource.gallery);
                        if (photo != null) {
                          final bytes = await File(photo.path).readAsBytes();
                          final base64String = base64Encode(bytes);
                          photos.add(photo);
                          photosBase64.add(base64String);
                          isUploaded.value = true;
                        }
                        Get.back();
                      },
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
                  ],
                ),
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
      photosBase64.removeAt(index);
    }
  }
}
