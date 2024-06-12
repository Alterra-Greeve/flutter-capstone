part of '../list_challenge_wrapper_screen.dart';

class ListChallengeMenuActiveWidget extends StatelessWidget {
  final String activeButton;

  const ListChallengeMenuActiveWidget({required this.activeButton, super.key});

  @override
  Widget build(BuildContext context) {
    switch (activeButton) {
      case 'Lakukan':
        return const ListChallengeTodoScreen();
      case 'Selesai':
        return const ListChallengeDoneScreen();
      case 'Dibatalkan':
        return const ListChallengeCancelScreen();
      default:
        return Container();
    }
  }
}
