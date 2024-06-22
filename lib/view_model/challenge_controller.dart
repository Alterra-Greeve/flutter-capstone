import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:greeve/models/api_responses/challenges_response_model.dart';
import 'package:greeve/services/api/api_challenge_service.dart';
import 'package:greeve/services/shared_pref/shared_pref.dart';
import 'package:greeve/utils/constants/colors_constant.dart';

class ChallengeController extends GetxController {
  final ApiChallengeService _apiService = ApiChallengeService();

  Rx<bool> isLoading = Rx<bool>(true);
  Rx<String?> errorMessage = Rx<String?>(null);
  RxList<Datum> challengesData = <Datum>[].obs;
  Rx<int> remainingDiscards = Rx<int>(3);
  Rx<int> remainingTake = Rx<int>(3);
  Rx<int> remainingShuffle = Rx<int>(5);

  var cardColors = <Color>[].obs;

  @override
  void onInit() {
    super.onInit();
    getChallenges();
  }

  void initializeCardColors() {
    List<Color> baseColors = [
      ColorsConstant.info300,
      ColorsConstant.danger300,
      ColorsConstant.warning300,
    ];

    cardColors.value = List.generate(challengesData.length, (index) {
      return baseColors[index % baseColors.length];
    });
  }

  void getChallenges() async {
    final String? token = await SharedPreferencesManager.getToken();
    challengesData.clear();
    isLoading.value = true;
    try {
      final result = await _apiService.getChallenges(token);
      challengesData.value = result.data;
      errorMessage.value = '';
      initializeCardColors();
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  void postChallengesParticipate(String? type, String? challengeId) async {
    final String? token = await SharedPreferencesManager.getToken();
    try {
      await _apiService.postChallengesParticipate(token, type, challengeId);
      if (type == "Ditolak") {
        if (remainingDiscards.value > 0) {
          remainingDiscards.value--;
        }
      } else if (type == "Diterima") {
        if (remainingTake.value > 0) {
          remainingTake.value--;
        }
      }
    } catch (e) {
      errorMessage.value = e.toString();
    }
  }

  void shuffleCards() {
    challengesData.shuffle();
    initializeCardColors();
    remainingShuffle.value--;
  }
}
