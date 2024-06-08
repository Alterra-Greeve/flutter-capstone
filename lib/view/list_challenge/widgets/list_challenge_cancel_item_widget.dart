import 'package:flutter/material.dart';
import 'package:greeve/view/list_challenge/widgets/list_challenge_empty_item_widget.dart';

class ListChallengeCancelItemWidget extends StatelessWidget {
  const ListChallengeCancelItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListChallengeEmptyItemWidget(
      titleText: 'Wah! tidak ada tantangan yang dibatalkan',
    );
  }
}
