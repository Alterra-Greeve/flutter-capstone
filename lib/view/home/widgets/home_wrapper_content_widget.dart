part of '../screens/home_screen.dart';

class HomeWrapperContentWidget extends StatelessWidget {
  const HomeWrapperContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double aspectRatio = screenWidth < 1000 ? 1.3 : 16 / 9;
    return Column(
      children: [
        HomeProductCarouselWidget(aspectRatio: aspectRatio),
        const HomeContentWidget(),
      ],
    );
  }
}
