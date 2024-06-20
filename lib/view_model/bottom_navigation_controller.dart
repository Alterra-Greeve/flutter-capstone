import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  @override
  void onInit() {
    _pageController = PageController(initialPage: selectedIndex.value);
    super.onInit();
  }

  void onItemTapped(int index) {
    selectedIndex.value = index;
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void onPageChanged(int index) {
    selectedIndex.value = index;
  }
}
