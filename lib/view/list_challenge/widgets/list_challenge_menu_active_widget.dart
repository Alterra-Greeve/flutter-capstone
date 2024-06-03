import 'package:flutter/material.dart';
import 'package:greeve/view/list_challenge/widgets/list_challenge_cancel_item_widget.dart';
import 'package:greeve/view/list_challenge/widgets/list_challenge_done_item_widget.dart';
import 'package:greeve/view/list_challenge/widgets/list_challenge_todo_item_widget.dart';

class ListChallengeMenuActiveWidget extends StatelessWidget {
  final String activeButton;

  const ListChallengeMenuActiveWidget({required this.activeButton, super.key});

  @override
  Widget build(BuildContext context) {
    switch (activeButton) {
      case 'Lakukan':
        return const ListChallengeTodoItemWidget();
      case 'Selesai':
        return const ListChallengeDoneItemWidget();
      case 'Dibatalkan':
        return const ListChallengeCancelItemWidget();
      default:
        return Container();
    }
  }
}
