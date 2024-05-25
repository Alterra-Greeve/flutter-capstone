import 'package:flutter/material.dart';

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
          children: [
            ShopPageOne(),
            ShopPageTwo(),
            ShopPageThree(),
          ],
        ),
        Positioned(
          top: MediaQ,
          child: GestureDetector())
      ]),
    );
  }
}
