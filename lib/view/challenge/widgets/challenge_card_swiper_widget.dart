import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greeve/global_widgets/global_button_widget.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view/challenge/widgets/challenge_card_widget.dart';
import 'package:greeve/view/challenge/widgets/challenge_empty_widget.dart';
import 'package:greeve/view_model/challenge_controller.dart';
import 'package:shimmer/shimmer.dart';

class ChallengeCardSwiperWidget extends StatelessWidget {
  final ChallengeController controller;
  const ChallengeCardSwiperWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade200,
          child: Container(
            width: double.infinity,
            height: 546,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        );
      }

      final int cardsCount = controller.challengesData.length;

      if (cardsCount == 0) {
        return const ChallengeEmptyWidget();
      }

      final int numberOfCardsDisplayed = (cardsCount >= 3) ? 3 : cardsCount;

      return SizedBox(
        width: double.infinity,
        height: 560,
        child: CardSwiper(
          padding: const EdgeInsets.only(top: 32),
          cardsCount: cardsCount,
          cardBuilder: (context, index, x, y) {
            var challenge = controller.challengesData[index];
            return ChallengeCardWidget(
              cardColors: controller.cardColors[index],
              image: challenge.imageUrl,
              title: challenge.title,
              description: challenge.description,
              difficulty: challenge.difficulty,
              exp: challenge.exp.toString(),
              coin: challenge.coin.toString(),
              participant: challenge.participant.toString(),
              impactCategories: controller.impactCategories,
            );
          },
          backCardOffset: const Offset(0, -35),
          allowedSwipeDirection:
              const AllowedSwipeDirection.only(right: true, left: true),
          numberOfCardsDisplayed: numberOfCardsDisplayed,
          isLoop: false,
          onSwipe: (previous, current, direction) {
            var challenge = controller.challengesData[previous];
            if (direction == CardSwiperDirection.right) {
              controller.postChallengesParticipate(
                "Diterima",
                challenge.id,
              );
            } else if (direction == CardSwiperDirection.left) {
              controller.postChallengesParticipate(
                "Ditolak",
                challenge.id,
              );
            }
            return true;
          },
        ),
      );
    });
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
          GestureDetector(
            onTap: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
            child: SvgPicture.asset(
              IconsConstant.closeShuffleSnackbar,
            ),
          ),
        ],
      ),
    ),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
    padding: const EdgeInsets.all(0),
    margin: const EdgeInsets.only(
      bottom: 88,
      right: 16,
      left: 16,
    ),
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
          GestureDetector(
            onTap: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
            child: SvgPicture.asset(
              IconsConstant.closeShuffleSnackbar,
              colorFilter: const ColorFilter.mode(
                  ColorsConstant.neutral50, BlendMode.srcIn),
            ),
          ),
        ],
      ),
    ),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
    padding: const EdgeInsets.all(0),
    margin: const EdgeInsets.only(
      bottom: 88,
      right: 16,
      left: 16,
    ),
    duration: const Duration(seconds: 3),
    backgroundColor: ColorsConstant.danger500,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void showChallengeLimitDialog(
  BuildContext context,
  String image,
  String title,
  String description,
) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: const EdgeInsets.all(24),
        content: SizedBox(
          width: 326,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(image),
              const SizedBox(height: 28),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: TextStylesConstant.nunitoTitleBold.copyWith(
                    color: ColorsConstant.neutral800,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  description,
                  style: TextStylesConstant.nunitoCaption.copyWith(
                    color: ColorsConstant.neutral800,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(height: 28),
              Align(
                alignment: Alignment.centerRight,
                child: GlobalButtonWidget(
                  text: 'Oke',
                  onTap: () {
                    Navigator.pop(context);
                  },
                  buttonWidth: 135,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
