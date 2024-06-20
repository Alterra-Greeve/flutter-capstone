import 'package:get/get.dart';
<<<<<<< HEAD
import 'package:greeve/view/environtment_impact/screen/impact_screen.dart';
import 'package:greeve/view/login/screens/login_screen.dart';
import 'package:greeve/view/onboarding/screens/screen_three.dart';
import 'package:greeve/view/product/screens/product_screen.dart';
import 'package:greeve/view/register/screens/register_screen.dart';

class BottomNavController extends GetxController {
  Rx<int> selectedIndex = Rx<int>(0);

  late PageController _pageController;
  PageController get pageController => _pageController;

  static final List<Widget> _widgetOptions = [
    const LoginScreen(),
    const RegisterScreen(),
    const ProductScreen(),
    ImpactScreen(),
    const ScreenThree(),
  ];
  List<Widget> get widgetOptions => _widgetOptions;
=======
import 'package:greeve/routes/app_routes.dart';
import 'package:greeve/services/shared_pref/shared_pref.dart';

class BottomNavController extends GetxController {
  Rx<int> selectedIndex = Rx<int>(0);
  RxBool isLoggedIn = true.obs;
>>>>>>> 81f867a5e8cc02eb4eb92360bf9c872a4426b0bc

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
