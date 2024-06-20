import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greeve/view_model/detail_challenge_controller.dart';

class DetailChallengeHeaderWidget extends StatelessWidget {
  final DetailChallengeController controller;
  const DetailChallengeHeaderWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Obx(
        () => CachedNetworkImage(
          imageUrl: controller.challengeData.value?.challenge.imageUrl ?? "",
          width: double.infinity,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
