import 'package:flutter/material.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view/auth_flow/screens/login_screen.dart';
import 'package:greeve/view/introduction/screen/screen_one.dart';
import 'package:greeve/view/introduction/screen/screen_three.dart';
import 'package:greeve/view/introduction/screen/screen_two.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _controller = PageController();
  int totalPage = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        PageView(
          controller: _controller,
          children: [
            ScreenOne(),
            ScreenTwo(),
            ScreenThree(),
          ],
        ),
        // Positioned(
        //     top: MediaQuery.of(context).padding.top + 24,
        //     child: GestureDetector()),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 530, left: 145),
          child: Row(
            children: [
              SmoothPageIndicator(
                controller: _controller,
                count: totalPage,
                effect: WormEffect(
                    dotColor: ColorsConstant.neutral500,
                    activeDotColor: ColorsConstant.primary500,
                    spacing: 5,
                    dotHeight: 2.5,
                    dotWidth: 25),
              ),
            ],
          ),
        ),
        Positioned(
          top: 720,
          left: 15,
          child: Row(
            children: [
              TextButton(
                  onPressed: () {
                    _controller.jumpToPage(2);
                  },
                  child: Text('Lewati')),
              SizedBox(
                width: 155,
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
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                  }
                },
                child: Container(
                  width: 130,
                  height: 60,
                  decoration: BoxDecoration(
                      color: ColorsConstant.primary500,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
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
      ]),
    );
  }
}
