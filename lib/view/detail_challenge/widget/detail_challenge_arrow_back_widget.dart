import 'package:flutter/material.dart';

class DetailChallengeArrowBackWidget extends StatelessWidget {
  const DetailChallengeArrowBackWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40,
      left: 16,
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.arrow_back),
        ),
      ),
    );
  }
}
