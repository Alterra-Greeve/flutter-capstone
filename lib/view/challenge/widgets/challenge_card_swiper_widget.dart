import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:greeve/view/challenge/widgets/challenge_card_widget.dart';

class ChallengeCardSwiperWidget extends StatelessWidget {
  const ChallengeCardSwiperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 560,
      child: CardSwiper(
        padding: const EdgeInsets.only(top: 32),
        cardsCount: 5,
        cardBuilder: (context, index, x, y) {
          return ChallengeCardWidget(index: index);
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
        onEnd: () {
          
        },
      ),
    );
  }
}
