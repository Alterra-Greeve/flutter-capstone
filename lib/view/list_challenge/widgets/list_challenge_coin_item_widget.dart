part of '../list_challenge_wrapper_screen.dart';

class ListChallengeCoinItemWidget extends StatelessWidget {
  final int? coinChallenge;

  const ListChallengeCoinItemWidget({
    super.key,
    required this.coinChallenge,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: ColorsConstant.neutral100,
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            IconsConstant.coin,
          ),
          const SizedBox(
            width: 6.35,
          ),
          Text(
            '+$coinChallenge',
            style: TextStylesConstant.nunitoCaptionBold.copyWith(
              color: ColorsConstant.warning500,
            ),
          )
        ],
      ),
    );
  }
}
