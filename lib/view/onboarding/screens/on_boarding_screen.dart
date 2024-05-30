import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/routes/app_routes.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view/onboarding/screens/screen_one.dart';
import 'package:greeve/view/onboarding/screens/screen_two.dart';
import 'package:greeve/view/onboarding/screens/screen_three.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();
  int currentPage = 0;
  int totalPage = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            children: const [
              ScreenOne(key: PageStorageKey('ScreenOne')),
              ScreenTwo(key: PageStorageKey('ScreenTwo')),
              ScreenThree(key: PageStorageKey('ScreenThree')),
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
                effect: const WormEffect(
                  dotColor: ColorsConstant.neutral500,
                  activeDotColor: ColorsConstant.primary500,
                  spacing: 5,
                  dotHeight: 2.5,
                  dotWidth: 25,
                ),
              ),
            ),
          ),
          _buildButton(),
        ],
      ),
    );
  }

  Widget _buildButton() {
    if (currentPage == 2) {
      return Positioned(
        bottom: 16.0,
        left: 16.0,
        right: 16.0,
        child: InkWell(
          onTap: () {
            Get.offAndToNamed(AppRoutes.login);
          },
          child: Ink(
            width: double.infinity,
            height: 50,
            decoration: const BoxDecoration(
              color: ColorsConstant.primary500,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Center(
              child: Text(
                'Mulai',
                style: TextStylesConstant.nunitoButtonLarge.copyWith(
                  color: ColorsConstant.neutral100,
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      return Positioned(
        bottom: 16.0,
        left: 16.0,
        right: 16.0,

        
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: TextButton(
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
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                _controller.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                );
              },
              child: Ink(
                width: 110,
                height: 50,
                decoration: const BoxDecoration(
                  color: ColorsConstant.primary500,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Selanjutnya',
                    style: TextStylesConstant.nunitoButtonLarge.copyWith(
                      color: ColorsConstant.neutral100,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
