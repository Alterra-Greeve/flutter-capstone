import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view/login/screens/login_screen.dart';
import 'package:greeve/view/onboarding/screens/screen_one.dart';
import 'package:greeve/view/onboarding/screens/screen_three.dart';
import 'package:greeve/view/onboarding/screens/screen_two.dart';
import 'package:greeve/view/register/screens/register_screen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<BottomNavScreen> {
  late PageController _pageController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  static final List<Widget> _widgetOptions = [
    const LoginScreen(),
    const RegisterScreen(),
    const ScreenTwo(),
    const ScreenOne(),
    const ScreenThree(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: _widgetOptions,
      ),
      bottomNavigationBar: SizedBox(
        height: 88,
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          showUnselectedLabels: true,
          unselectedLabelStyle: TextStylesConstant.nunitoButtonMedium,
          selectedLabelStyle: TextStylesConstant.nunitoButtonMedium,
          selectedItemColor: ColorsConstant.primary500,
          unselectedItemColor: ColorsConstant.neutral500,
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: SvgPicture.asset(
                  _selectedIndex == 0
                      ? IconsConstant.homeNavOn
                      : IconsConstant.homeNavOff,
                ),
              ),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: SvgPicture.asset(IconsConstant.challengeNavOff),
              ),
              label: 'Tantangan',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: SvgPicture.asset(IconsConstant.productNavOff),
              ),
              label: 'Produk',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: SvgPicture.asset(IconsConstant.impactNavOff),
              ),
              label: 'Dampak',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: SvgPicture.asset(IconsConstant.profileNavOff),
              ),
              label: 'Profil',
            ),
          ],
        ),
      ),
    );
  }
}
