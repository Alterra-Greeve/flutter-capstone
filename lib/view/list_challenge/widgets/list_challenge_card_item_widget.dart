import 'package:flutter/material.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/images_constant.dart';
// import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view/list_challenge/widgets/list_challenge_button_item_widget.dart';
import 'package:greeve/view/list_challenge/widgets/list_challenge_coin_item_widget.dart';
import 'package:greeve/view/list_challenge/widgets/list_challenge_exp_item_widget.dart';
import 'package:greeve/view/list_challenge/widgets/list_challenge_level_item_widget.dart';
// import 'package:greeve/view/list_challenge/widgets/list_challenge_status_item_widget.dart';
import 'package:greeve/view/list_challenge/widgets/list_challenge_time_item_widget.dart';
import 'package:greeve/view/list_challenge/widgets/list_challenge_title_item_widget.dart';

class ListChallengeCardItemWidget extends StatelessWidget {
  const ListChallengeCardItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(
            8,
          ),
        ),
        color: ColorsConstant.neutral50,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 2,
            offset: const Offset(0, 1),
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(
                  8,
                ),
                child: Image.asset(
                  ImagesConstant.challengeImageSample,
                  height: 70,
                  width: 100,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // TODO 1: Make conditional value with API
                  // TODO 2: Make list view builder for this
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ListChallengeLevelItemWidget(
                        levelChallenge: 'Sulit',
                        backgroundColor: ColorsConstant.danger100,
                        textColor: ColorsConstant.danger600,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      ListChallengeExpItemWidget(
                        expChallenge: '100',
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      ListChallengeCoinItemWidget(
                        coinChallenge: '100',
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListChallengeTitleItemWidget(
                    titleChallenge: 'Mengurangi Sampah Plastik',
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          const Row(
            children: [
              ListChallengeTimeItemWidget(
                timeChallenge: '10:06:30',
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(child: ListChallengeButtonItemWidget()),
            ],
          ),
          // TODO 3: Make conditional
          
          // const ListChallengeStatusItemWidget(
          //   statusChallenge: 'Hebat! Kamu bisa menyelesaikannya',
          //   backgroundColor: ColorsConstant.success100,
          //   textColor: ColorsConstant.success600,
          // ),
        ],
      ),
    );
  }
}
