part of '../list_challenge_wrapper_screen.dart';


class ListChallengeTitleItemWidget extends StatelessWidget {
  final String? titleChallenge;
  const ListChallengeTitleItemWidget({
    super.key,
    this.titleChallenge,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      titleChallenge ?? '',
      style: TextStylesConstant.nunitoSubtitle.copyWith(
        fontWeight: FontWeight.w900,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
