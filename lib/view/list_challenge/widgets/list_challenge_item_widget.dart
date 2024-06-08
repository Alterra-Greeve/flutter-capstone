import 'package:flutter/material.dart';
import 'package:greeve/models/api_responses/get_user_challenge_response_model.dart';

class ListChallengeItemWidget extends StatelessWidget {
  final List<Datum> challenges;

  const ListChallengeItemWidget({required this.challenges, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: challenges.length,
        itemBuilder: (context, index) {
          final challenge = challenges[index];
          return ListTile(
            title: Text(challenge.title ?? ''),
            subtitle: Text(challenge.description ?? ''),
            trailing: Text('Points: ${challenge.point ?? 0}'),
          );
        },
      ),
    );
  }
}
