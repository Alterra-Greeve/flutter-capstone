import 'package:get/get.dart';
import 'package:greeve/routes/app_routes.dart';
import 'package:greeve/services/shared_pref/shared_pref.dart';

class BottomNavController extends GetxController {
  Rx<int> selectedIndex = Rx<int>(0);
  RxBool isLoggedIn = true.obs;

  @override
  void onInit() {
    isLoggedIn.value = true;
    super.onInit();
  }

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }

  void onPageChanged(int index) {
    selectedIndex.value = index;
  }

  void resetSelectedIndex() {
    selectedIndex.value = 0;
  }

  void logout() {
    isLoggedIn.value = false;
    selectedIndex.value = 0;
    SharedPreferencesManager.removeAllKeys();
    Get.deleteAll();
    Get.offAllNamed(AppRoutes.splashApp);
  }
}