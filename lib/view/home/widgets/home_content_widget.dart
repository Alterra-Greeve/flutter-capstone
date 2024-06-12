part of '../screens/home_screen.dart';

class HomeContentWidget extends StatelessWidget {
  const HomeContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
          decoration: const BoxDecoration(
            color: ColorsConstant.neutral50,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeCategoryProductWidget(),
              HomeRecomendedProductWidget(),
            ],
          ),
        ),
        const Positioned(
          top: -80,
          left: 0,
          right: 0,
          child: HomeUserDetailWidget(),
        ),
      ],
    );
  }
}
