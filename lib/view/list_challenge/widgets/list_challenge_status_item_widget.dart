part of '../list_challenge_wrapper_screen.dart';

class ListChallengeStatusItemWidget extends StatelessWidget {
  final String statusChallenge;

  const ListChallengeStatusItemWidget({
    super.key,
    required this.statusChallenge,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color textColor;
    String statusChallengeFinal;

    switch (statusChallenge) {
      case "Pending":
        backgroundColor = ColorsConstant.primary500;
        textColor = ColorsConstant.neutral100;
        statusChallengeFinal = 'Selesaikan Misi';

        break;
      case "Diterima":
        backgroundColor = ColorsConstant.warning50;
        textColor = ColorsConstant.danger600;
        statusChallengeFinal = 'Hebat! Kamu bisa menyelesaikannya';
        break;
      case "Ditolak":
        backgroundColor = ColorsConstant.success50;
        textColor = ColorsConstant.success600;
        statusChallengeFinal = 'Yah! waktunya habis';
        break;
      default:
        backgroundColor = ColorsConstant.neutral100;
        textColor = ColorsConstant.black;
        statusChallengeFinal = 'Misterius';
        break;
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(
          8,
        ),
      ),
      child: Text(
        statusChallengeFinal.toString(),
        textAlign: TextAlign.center,
        style: TextStylesConstant.nunitoCaptionBold.copyWith(
          color: textColor,
        ),
      ),
    );
  }
}
