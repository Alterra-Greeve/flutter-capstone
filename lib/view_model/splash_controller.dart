import 'package:get/get.dart';
import 'package:greeve/services/shared_pref/shared_pref.dart';
import 'package:greeve/view/common/bottom_navigation_screen.dart';
import 'package:greeve/view/onboarding/screens/on_boarding_screen.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checkLogin();
  }

  Future<void> checkLogin() async {
    final String? token = await SharedPreferencesManager.getToken();
    if (token != null) {
      await Future.delayed(const Duration(seconds: 3));
      // Get.off(() => const OnBoardingScreen());
      Get.off(() => const BottomNavScreen());
    } else {
      await Future.delayed(const Duration(seconds: 3));
      Get.off(() => const OnBoardingScreen());
    }
  }
}
