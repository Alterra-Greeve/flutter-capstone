import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_svg/svg.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view/challenge/widgets/challenge_card_widget.dart';
import 'package:greeve/view_model/challenge_controller.dart';

class ChallengeCardSwiperWidget extends StatelessWidget {
  final ChallengeController controller;
  const ChallengeCardSwiperWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 560,
      child: CardSwiper(
        padding: const EdgeInsets.only(top: 32),
        cardsCount: 5,
        cardBuilder: (context, index, x, y) {
          return ChallengeCardWidget(
            cardColors: controller.cardColors[index],
            cardImage: controller.images[index],
          );
        },
        backCardOffset: const Offset(0, -35),
        allowedSwipeDirection:
            const AllowedSwipeDirection.only(right: true, left: true),
        numberOfCardsDisplayed: 3,
        isLoop: true,
        onSwipe: (previous, current, direction) {
          if (direction == CardSwiperDirection.right) {
          } else if (direction == CardSwiperDirection.left) {}
          return true;
        },
      ),
    );
  }
}

void showShuffleSuccessSnackbar(
  BuildContext context,
) {
  final snackBar = SnackBar(
    content: Container(
      padding: const EdgeInsets.all(12),
      height: 56,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(IconsConstant.shuffleSuccess),
              const SizedBox(width: 12),
              Text(
                'Acak tantangan berhasil',
                style: TextStylesConstant.nunitoButtonLarge.copyWith(
                  color: ColorsConstant.neutral900,
                ),
              ),
            ],
          ),
          SvgPicture.asset(IconsConstant.closeShuffleSnackbar),
        ],
      ),
    ),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
    padding: const EdgeInsets.all(0),
    duration: const Duration(seconds: 3),
    backgroundColor: ColorsConstant.neutral50,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void showShuffleFailedSnackbar(
  BuildContext context,
) {
  final snackBar = SnackBar(
    content: Container(
      padding: const EdgeInsets.all(12),
      height: 56,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(IconsConstant.shuffleFailed),
              const SizedBox(width: 12),
              Text(
                'Tidak bisa acak tantangan lagi',
                style: TextStylesConstant.nunitoButtonLarge.copyWith(
                  color: ColorsConstant.neutral50,
                ),
              ),
            ],
          ),
          SvgPicture.asset(
            IconsConstant.closeShuffleSnackbar,
            colorFilter: const ColorFilter.mode(
                ColorsConstant.neutral50, BlendMode.srcIn),
          ),
        ],
      ),
    ),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
    padding: const EdgeInsets.all(0),
    duration: const Duration(seconds: 3),
    backgroundColor: ColorsConstant.danger500,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
