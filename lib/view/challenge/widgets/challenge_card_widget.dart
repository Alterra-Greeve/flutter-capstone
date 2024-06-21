import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:greeve/models/api_responses/challenges_response_model.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/utils/status_color_utils.dart';

class ChallengeCardWidget extends StatelessWidget {
  final Color cardColors;
  final String? image;
  final String? title;
  final String? description;
  final String? difficulty;
  final String? exp;
  final String? coin;
  final String? participant;
  final List<Category> impactCategories;
  const ChallengeCardWidget({
    super.key,
    required this.cardColors,
    required this.image,
    required this.title,
    required this.description,
    required this.difficulty,
    required this.exp,
    required this.coin,
    required this.participant,
    required this.impactCategories,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: cardColors,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 70,
                  height: 36,
                  decoration: BoxDecoration(
                    color: getDifficultyBackgroundColor(difficulty ?? ""),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      difficulty ?? "",
                      style: TextStyle(
                        color: getDifficultyTextColor(difficulty ?? ""),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 62,
                      height: 28,
                      decoration: const BoxDecoration(
                        color: ColorsConstant.neutral50,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(IconsConstant.poinXp),
                            const SizedBox(width: 4),
                            Text(
                              "+${exp ?? '0'}",
                              style:
                                  TextStylesConstant.nunitoCaptionBold.copyWith(
                                color: ColorsConstant.success600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      width: 62,
                      height: 28,
                      decoration: const BoxDecoration(
                        color: ColorsConstant.neutral50,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(IconsConstant.coin),
                            const SizedBox(width: 4),
                            Text(
                              "+${coin ?? '0'}",
                              style:
                                  TextStylesConstant.nunitoCaptionBold.copyWith(
                                color: ColorsConstant.success600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 18),
            SizedBox(
              width: double.infinity,
              height: 214,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: image ?? "",
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
            ),
            const SizedBox(height: 18),
            Text(
              title ?? "",
              style: TextStylesConstant.nunitoHeading3.copyWith(
                fontWeight: FontWeight.w800,
                color: ColorsConstant.neutral900,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            const SizedBox(height: 18),
            Row(
              children: [
                Text(
                  'Membantu',
                  style: TextStylesConstant.nunitoButtonBold.copyWith(
                    color: ColorsConstant.neutral900,
                  ),
                ),
                const SizedBox(width: 16),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: impactCategories.map((category) {
                    String imagePath;
                    switch (category.impactCategory.name) {
                      case Name.HEMAT_UANG:
                        imagePath = IconsConstant.challengeIconCategory1;
                        break;
                      case Name.MENGURANGI_PEMANASAN_GLOBAL:
                        imagePath = IconsConstant.challengeIconCategory2;
                        break;
                      case Name.PERLUAS_WAWASAN:
                        imagePath = IconsConstant.challengeIconCategory3;
                        break;
                      case Name.MENGURANGI_LIMBAH:
                        imagePath = IconsConstant.challengeIconCategory4;
                        break;
                      default:
                        imagePath = IconsConstant.iconPlaceholder;
                        break;
                    }
                    return Container(
                      width: 48,
                      height: 48,
                      decoration: const BoxDecoration(
                        color: ColorsConstant.primary500,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
            const SizedBox(height: 18),
            Text(
              description ?? "",
              style: TextStylesConstant.nunitoCaption.copyWith(
                color: ColorsConstant.neutral900,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
            const SizedBox(height: 18),
            Row(
              children: [
                SvgPicture.asset(IconsConstant.threeUser),
                const SizedBox(width: 8),
                Text(
                  participant ?? "0",
                  style: TextStylesConstant.nunitoFooterBold,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(width: 4),
                Text(
                  'orang sedang melakukan tantangan ini',
                  style: TextStylesConstant.nunitoFooter,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
