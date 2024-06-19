part of '../screens/home_screen.dart';

class HomeWrapperContentWidget extends StatelessWidget {
  const HomeWrapperContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        HomeProductCarouselWidget(),
        HomeContentWidget(),
      ],
    );
  }
}
