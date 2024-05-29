import 'package:get/get.dart';
import 'package:greeve/services/shared_pref/shared_pref.dart';
import 'package:greeve/view/home/screens/home_screen.dart';
// import 'package:greeve/view/onboarding/screens/on_boarding_screen.dart';
import 'package:greeve/view/view_product/screens/view_product/product_screen.dart';

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
      Get.off(() => const HomeScreen());
    } else {
      await Future.delayed(const Duration(seconds: 3));
      // Get.off(() => const OnBoardingScreen());
      Get.off(() => const ProductScreen());
    }
  }
}
