import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greeve/view/challenge/screens/challenge_screen.dart';
import 'package:greeve/view/home/screens/home_screen.dart';
import 'package:greeve/view/product/screens/product_screen.dart';
import 'package:greeve/view/user_profile/screens/user_profile_screen.dart';

class BottomNavController extends GetxController {
  Rx<int> selectedIndex = Rx<int>(0);

  static final List<Widget> _widgetOptions = [
    const HomeScreen(),
    const ChallengeScreen(),
    const ProductScreen(),
    const Scaffold(body: Center(child: Text('On progress'),),),
    const UserProfileScreen(),
  ];
  List<Widget> get widgetOptions => _widgetOptions;

  void onItemTapped(int index) {
    selectedIndex.value = index;

  }

  void onPageChanged(int index) {
    selectedIndex.value = index;
  }
}
