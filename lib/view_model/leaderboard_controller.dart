import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greeve/models/api_responses/leaderboard_response_model.dart';
import 'package:greeve/services/api/api_leaderboard_service.dart';
import 'package:greeve/services/shared_pref/shared_pref.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';

class LeaderboardController extends GetxController {
  final ApiLeaderboardService _apiService = ApiLeaderboardService();
  Rx<String?> errorMessage = Rx<String?>(null);
  RxList<Datum> leaderboardData = <Datum>[].obs;
  Rx<bool> isLoading = Rx<bool>(false);

  @override
  void onInit() {
    super.onInit();
    getLeaderBoardData();
  }

  void getLeaderBoardData() async {
    isLoading.value = true;
    try {
      final String? token = await SharedPreferencesManager.getToken();
      final result = await _apiService.getLeaderboard(token);
      if (result.status == true) {
        leaderboardData.value = result.data ?? [];
      } else {
        errorMessage.value = result?.message ?? "Unknown error occurred";
      }
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  void showHelpBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.5,
          minChildSize: 0.5,
          maxChildSize: 0.7,
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Container(
                      height: 3,
                      width: 70,
                      color: ColorsConstant.neutral600,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Informasi',
                      style: TextStylesConstant.nunitoHeading4,
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Text(
                          """
Kumpulkan EXP dari challenges untuk menjadi peringkat teratas dan 
dapatkan hadianya. Hadiah akan diberikan melalui notifikasi dengan 
jumlah hadiah yang sesuai peringkat ketika waktu Leaderboard berakhir (30 Hari). 
Peringkat ke 1 : 5000 Coin
Peringkat ke 2 : 4000 Coin 
Peringkat ke 3 : 3000 Coin
""",
                          style: TextStylesConstant.nunitoSubtitle2_,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: ColorsConstant.primary500,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'Mengerti',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  String truncateName(String? name) {
    if (name == null) return '';
    return name.length > 7 ? name.substring(0, 5) : name;
  }
}
