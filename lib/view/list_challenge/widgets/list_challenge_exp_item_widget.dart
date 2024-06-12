part of '../list_challenge_wrapper_screen.dart';

class ListChallengeExpItemWidget extends StatelessWidget {
  final int? expChallenge;

  const ListChallengeExpItemWidget({
    super.key,
    this.expChallenge,
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
            IconsConstant.poinXp,
          ),
          const SizedBox(
            width: 6.35,
          ),
          Text(
            '+$expChallenge',
            style: TextStylesConstant.nunitoCaptionBold.copyWith(
              color: ColorsConstant.danger400,
            ),
          )
        ],
      ),
    );
  }
}
