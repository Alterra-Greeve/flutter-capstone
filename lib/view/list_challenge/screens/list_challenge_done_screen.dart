part of '../list_challenge_wrapper_screen.dart';

class ListChallengeDoneScreen extends StatelessWidget {
  const ListChallengeDoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ListChallengeController listChallengeController =
        Get.put(ListChallengeController());

    return Obx(() {
      if (listChallengeController.isLoading.value) {
        return Center(
          child: SizedBox(
            width: 50,
            child: LoadingIndicator(
              indicatorType: Indicator.ballBeat,
              strokeWidth: 4.0,
              colors: [Theme.of(context).primaryColor],
            ),
          ),
        );
      } else if (listChallengeController.errorMessage.value != null) {
        return ListChallengeEmptyItemWidget(
          titleText: listChallengeController.errorMessage.value ??
              'Maaf, terjadi kesalahan saat memuat data',
        );
      } else if (listChallengeController.acceptedChallenges.isEmpty) {
        return const ListChallengeEmptyItemWidget(
          titleText: 'Maaf, belum ada tantangan yang selesai',
        );
      } else {
        return Column(
          children: listChallengeController.acceptedChallenges.map((challenge) {
            return GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.detailChallenge);
              },
              child: Column(
                children: [
                  Container(
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
                              child: CachedNetworkImage(
                                imageUrl: challenge.challenge?.imageUrl ??
                                    "https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png",
                                height: 70,
                                width: 100,
                                fit: BoxFit.cover,
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ListChallengeDifficultyItemWidget(
                                        difficultyChallenge:
                                            challenge.challenge!.difficulty!,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      ListChallengeExpItemWidget(
                                        expChallenge: challenge.challenge?.exp,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      ListChallengeCoinItemWidget(
                                        coinChallenge:
                                            challenge.challenge?.coin,
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  ListChallengeTitleItemWidget(
                                    titleChallenge: challenge.challenge?.title,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        ListChallengeStatusItemWidget(
                          statusChallenge: challenge.status!,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            );
          }).toList(),
        );
      }
    });
  }
}
