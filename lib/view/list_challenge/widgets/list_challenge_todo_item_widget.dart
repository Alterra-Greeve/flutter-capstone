import 'package:flutter/material.dart';
import 'package:greeve/view/list_challenge/widgets/list_challenge_card_item_widget.dart';
// import 'package:greeve/view/list_challenge/widgets/list_challenge_empty_item_widget.dart';

class ListChallengeTodoItemWidget extends StatelessWidget {
  const ListChallengeTodoItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListChallengeCardItemWidget();
    
    // const ListChallengeEmptyItemWidget(
    //   titleText: 'Maaf, kamu belum mengambil tantangan',
    //   descriptionText:
    //       'Mulai sekarang dan berkontribusilah untuk lingkungan yang lebih hijau!',
    // );
  }
}
