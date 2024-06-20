part of '../list_challenge_wrapper_screen.dart';

class ListChallengeDifficultyItemWidget extends StatelessWidget {
  final String difficultyChallenge;

  const ListChallengeDifficultyItemWidget({
    super.key,
    required this.difficultyChallenge,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color textColor;
    String difficultyText;

    switch (difficultyChallenge) {
      case "Sulit":
        backgroundColor = ColorsConstant.danger100;
        textColor = ColorsConstant.danger600;
        difficultyText = 'Sulit';

        break;
      case "sedang":
        backgroundColor = ColorsConstant.warning100;
        textColor = ColorsConstant.warning600;
        difficultyText = 'Sedang';
        break;
      case "Mudah":
        backgroundColor = ColorsConstant.success100;
        textColor = ColorsConstant.success600;
        difficultyText = 'Mudah';
        break;
      default:
        backgroundColor = ColorsConstant.neutral100;
        textColor = ColorsConstant.black;
        difficultyText = 'Misterius';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        difficultyText.toString(),
        style: TextStylesConstant.nunitoCaptionBold.copyWith(
          color: textColor,
        ),
      ),
    );
  }
}
