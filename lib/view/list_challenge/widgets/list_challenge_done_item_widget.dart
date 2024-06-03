import 'package:flutter/material.dart';
import 'package:greeve/view/list_challenge/widgets/list_challenge_empty_item_widget.dart';

class ListChallengeDoneItemWidget extends StatelessWidget {
  const ListChallengeDoneItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListChallengeEmptyItemWidget(
      titleText: 'Maaf, belum ada tantangan yang selesai',
    );
  }
}
