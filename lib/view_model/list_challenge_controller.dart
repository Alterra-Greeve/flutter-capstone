import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:greeve/services/api/api_challenge_service.dart';
import 'package:greeve/services/shared_pref/shared_pref.dart';
import 'package:greeve/models/api_responses/get_user_challenge_response_model.dart';

class ListChallengeController extends GetxController {
  var activeButton = 'Lakukan'.obs;
  var challengeList = <Datum>[].obs;
  Rx<bool> isLoading = Rx<bool>(false);

  final ApiChallengeService _apiChallengeService = ApiChallengeService();

  @override
  void onInit() {
    super.onInit();
    getChallenges();
  }

  void setActiveButton(String title) {
    activeButton.value = title;
    filterChallenges();
  }

  void getChallenges() async {
    try {
      isLoading(true);
      final String? token = await SharedPreferencesManager.getToken();
      if (token != null) {
        final response = await _apiChallengeService.getUserChallenge(token);
        challengeList.assignAll(response.data ?? []);
        filterChallenges();
      } else {
        if (kDebugMode) {
          print("Token is not available");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error fetching challenges: $e");
      }
    } finally {
      isLoading(false);
    }
  }

  void filterChallenges() {
    List<Datum> filteredList;
    switch (activeButton.value) {
      case 'Lakukan':
        filteredList = challengeList.where((challenge) => challenge.status == "Pending").toList();
        break;
      case 'Selesai':
        filteredList = challengeList.where((challenge) => challenge.status == "Accepted").toList();
        break;
      case 'Dibatalkan':
        filteredList = challengeList.where((challenge) => challenge.status == "Declined").toList();
        break;
      default:
        filteredList = [];
    }
    challengeList.assignAll(filteredList);
  }
}
