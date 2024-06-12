import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greeve/services/shared_pref/shared_pref.dart';
import 'package:greeve/view/home/screens/home_screen.dart';
import 'package:greeve/view/product/screens/product_screen.dart';

class BottomNavController extends GetxController {
  Rx<int> selectedIndex = Rx<int>(0);

  late PageController _pageController;
  PageController get pageController => _pageController;

  static final List<Widget> _widgetOptions = [
    const HomeScreen(),
    const Scaffold(
        body: Center(child: Text('Halaman Tantangan (On Progress)'))),
    const ProductScreen(),
    const Scaffold(body: Center(child: Text('Halaman Dampak (On Progress)'))),
    Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            SharedPreferencesManager.removeAllKeys();
          },
          child: const Text('Delete Token'),
        ),
      ),
    ),
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
