import 'package:flutter/material.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view/auth_flow/screens/login_screen.dart';
import 'package:greeve/view/introduction/screens/screen_one.dart';
import 'package:greeve/view/introduction/screens/screen_three.dart';
import 'package:greeve/view/introduction/screens/screen_two.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();
  int totalPage = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: const [
              ScreenOne(),
              ScreenTwo(),
              ScreenThree(),
            ],
          ),
          Positioned(
            bottom: 104,
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: _controller,
                count: totalPage,
                effect: WormEffect(
                  dotColor: ColorsConstant.neutral500,
                  activeDotColor: ColorsConstant.primary500,
                  spacing: 5,
                  dotHeight: 2.5,
                  dotWidth: 25,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 16.0,
            left: 16.0,
            right: 16.0,
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, // Space buttons evenly
              children: [
                TextButton(
                  onPressed: () {
                    _controller.jumpToPage(2);
                  },
                  child: Text(
                    'Lewati',
                    style: TextStylesConstant.nunitoButtonLarge.copyWith(
                      color: ColorsConstant.primary500,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 185,
                ),
                GestureDetector(
                  onTap: () {
                    if (_controller.page!.toInt() == totalPage - 1) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    } else {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      );
                    }
                  },
                  child: Container(
                    width: 110,
                    height: 50,
                    decoration: BoxDecoration(
                      color: ColorsConstant.primary500,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Selanjutnya',
                        style: TextStylesConstant.nunitoButtonLarge,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
