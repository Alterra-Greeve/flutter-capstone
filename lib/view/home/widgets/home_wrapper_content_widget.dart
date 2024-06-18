part of '../screens/home_screen.dart';

class HomeWrapperContentWidget extends StatelessWidget {
  const HomeWrapperContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    const Column(
      // TODO: Previously attempted using a stack, but ended up with errors

      //   Stack(
      //   clipBehavior: Clip.none,
      //   children: [
      //     HomeProductCarouselWidget(),
      //     Positioned(
      //       top: 240,
      //       left: 0,
      //       right: 0,

      //       child: HomeContentWidget(),
      //     ),
      //   ],
      // );

      children: [
        HomeProductCarouselWidget(),
        HomeContentWidget(),
      ],
    );
  }
}
