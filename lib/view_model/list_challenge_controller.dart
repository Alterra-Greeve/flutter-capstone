import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:greeve/services/api/api_challenge_service.dart';
import 'package:greeve/services/shared_pref/shared_pref.dart';
import 'package:greeve/models/api_responses/get_user_challenge_response_model.dart';

class ListChallengeController extends GetxController {
  RxList<Datum> pendingChallenges = <Datum>[].obs;
  RxList<Datum> acceptedChallenges = <Datum>[].obs;
  RxList<Datum> declinedChallenges = <Datum>[].obs;
  Rx<bool> isLoading = Rx<bool>(false);
  RxnString errorMessage = RxnString();
  RxString activeButton = 'Lakukan'.obs;

  final ApiChallengeService _apiChallengeService = ApiChallengeService();

  @override
  void onInit() {
    super.onInit();
    getChallenges();
  }

  void setActiveButton(String title) {
    activeButton.value = title;
  }

  void getChallenges() async {
    try {
      isLoading(true);
      final String? token = await SharedPreferencesManager.getToken();
      if (token != null) {
        final pendingResponse =
            await _apiChallengeService.getUserChallenge(token, 'Pending');
        final acceptedResponse =
            await _apiChallengeService.getUserChallenge(token, 'Accepted');
        final declinedResponse =
            await _apiChallengeService.getUserChallenge(token, 'Declined');

        pendingChallenges.assignAll(pendingResponse.data ?? []);
        acceptedChallenges.assignAll(acceptedResponse.data ?? []);
        declinedChallenges.assignAll(declinedResponse.data ?? []);
      } else {
        if (kDebugMode) {
          print("Token is not available");
        }
      }
    } catch (e) {
      errorMessage(e.toString());
      if (kDebugMode) {
        print("Error fetching challenges: $e");
      }
    } finally {
      isLoading(false);
    }
  }
}
