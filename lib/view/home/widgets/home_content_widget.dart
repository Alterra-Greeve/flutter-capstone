part of '../screens/home_screen.dart';

class HomeContentWidget extends StatelessWidget {
  const HomeContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      clipBehavior: Clip.none,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeCategoryProductWidget(),
            HomeRecomendedProductWidget(),
          ],
        ),
        Positioned(
          top: -130,
          left: 0,
          right: 0,
          child: HomeUserDetailWidget(),
        ),
      ],
    );
  }
}
