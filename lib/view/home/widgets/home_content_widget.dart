part of '../screens/home_screen.dart';

class HomeContentWidget extends StatefulWidget {
  const HomeContentWidget({super.key});

  @override
  HomeContentWidgetState createState() => HomeContentWidgetState();
}

class HomeContentWidgetState extends State<HomeContentWidget> {
  late TutorialCoachMark tutorialCoachMark;
  List<TargetFocus> targets = [];

  GlobalKey keyMembershipButton = GlobalKey();
  GlobalKey keyHomeUserDetail = GlobalKey();
  GlobalKey keyHomeCategoryProduct = GlobalKey();
  GlobalKey keyHomeRecomendedProduct = GlobalKey();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkFirstTime();
    });
  }

  void _checkFirstTime() async {
    if (await SharedPrefHelper.isFirstTime()) {
      Future.delayed(const Duration(seconds: 1), showTutorial);
    }
  }

  void showTutorial() {
    initTargets();
    if (targets.isEmpty) {
      if (kDebugMode) {
        print('Target kosong nih');
      }
      return;
    }
    tutorialCoachMark = TutorialCoachMark(
      hideSkip: true,
      unFocusAnimationDuration: Durations.medium1,
      focusAnimationDuration: Durations.medium1,
      pulseEnable: false,
      targets: targets,
      onFinish: () {
        SharedPrefHelper.setNotFirstTime();
      },
    )..show(context: context);
  }

  void initTargets() {
    targets.add(
      TargetFocus(
        focusAnimationDuration: Durations.medium1,
        unFocusAnimationDuration: Durations.medium1,
        paddingFocus: 8,
        shape: ShapeLightFocus.RRect,
        radius: 24,
        identify: "MembershipButton",
        keyTarget: keyMembershipButton,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            child: Center(
              child: HomeTutorialWidget(
                headerText: "1 dari 4",
                titleText: "Bergabung dengan Membership",
                descText: "Gabung dan nikmati keistimewaan!",
                onPressedNext: () {
                  tutorialCoachMark.next();
                },
                onPressedSkip: () {
                  tutorialCoachMark.finish();
                },
                nextText: "Selanjutnya",
                skipText: "Lewati",
              ),
            ),
          ),
        ],
      ),
    );

    targets.add(
      TargetFocus(
        focusAnimationDuration: Durations.medium1,
        unFocusAnimationDuration: Durations.medium1,
        paddingFocus: 2,
        shape: ShapeLightFocus.RRect,
        radius: 24,
        identify: "HomeUserDetail",
        keyTarget: keyHomeUserDetail,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            child: HomeTutorialWidget(
              headerText: "2 dari 4",
              titleText: "Dashboard Greeve",
              descText:
                  "Kumpulkan EXP untuk naik level dan berkompetisi di leaderboard, dapatkan lebih banyak coin yang bisa ditukar dengan potongan harga atau voucher belanja, serta tingkatkan poin untuk menunjukkan dampak positif aktivitas Anda!",
              onPressedNext: () {
                _scrollToCategoryProduct();

                tutorialCoachMark.next();
              },
              onPressedSkip: () {
                tutorialCoachMark.finish();
              },
              nextText: "Selanjutnya",
              skipText: "Lewati",
            ),
          ),
        ],
      ),
    );

    targets.add(
      TargetFocus(
        focusAnimationDuration: Durations.medium1,
        unFocusAnimationDuration: Durations.medium1,
        paddingFocus: 6,
        shape: ShapeLightFocus.RRect,
        radius: 24,
        identify: "HomeCategoryProduct",
        keyTarget: keyHomeCategoryProduct,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            child: HomeTutorialWidget(
              headerText: "3 dari 4",
              titleText: "Lihat Produk Ramah Lingkungan",
              descText:
                  "Jelajahi pilihan produk ramah lingkungan yang mendukung keberlanjutan.",
              onPressedNext: () {
                tutorialCoachMark.next();
              },
              onPressedSkip: () {
                tutorialCoachMark.finish();
              },
              nextText: "Selanjutnya",
              skipText: "Lewati",
            ),
          ),
        ],
      ),
    );

    targets.add(
      TargetFocus(
        focusAnimationDuration: Durations.medium1,
        unFocusAnimationDuration: Durations.medium1,
        paddingFocus: 6,
        shape: ShapeLightFocus.RRect,
        radius: 24,
        identify: "HomeRecomendedProduct",
        keyTarget: keyHomeRecomendedProduct,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            child: HomeTutorialWidget(
              headerText: "4 dari 4",
              titleText: "Rekomendasi Ramah Lingkungan",
              descText:
                  "Ini adalah dua produk yang kami sarankan untuk Anda coba.",
              onPressedNext: () {
                tutorialCoachMark.finish();
                SharedPrefHelper.setNotFirstTime();
              },
              onPressedSkip: () {
                tutorialCoachMark.finish();
              },
              nextText: "Mulai",
            ),
          ),
        ],
      ),
    );
  }

  void _scrollToCategoryProduct() {
    _scrollController.animateTo(
      1000,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());

    double screenWidth = MediaQuery.of(context).size.width;
    double aspectRatio = screenWidth < 1000 ? 1.3 : 16 / 9;
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        children: [
          Obx(
            () {
              final userProfile = homeController.userProfileData.value;

              if (homeController.isLoading.value) {
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
              } else if (homeController.errorMessage.value != null) {
                return Center(
                  child: Text('Error: ${homeController.errorMessage.value}'),
                );
              } else if (userProfile == null) {
                return const Center(
                  child: Text('No data'),
                );
              }

              return Container(
                color: ColorsConstant.white,
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Row(
                        children: [
                          ClipOval(
                            child: Image.network(
                              userProfile.data?.avatarUrl ?? '',
                              width: 48,
                              height: 48,
                              fit: BoxFit.fill,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(Icons.person, size: 48);
                              },
                            ),
                          ),
                          const SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Welcome,',
                                style: TextStylesConstant.nunitoCaption,
                              ),
                              Text(
                                userProfile.data?.name ?? 'No name',
                                style:
                                    TextStylesConstant.nunitoSubtitle4.copyWith(
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        TextButton(
                          key: keyMembershipButton,
                          onPressed: () {
                            Get.toNamed(AppRoutes.membership);
                          },
                          child: Text(
                            'Membership',
                            style:
                                TextStylesConstant.nunitoButtonLarge.copyWith(
                              color: ColorsConstant.primary500,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: SvgPicture.asset(
                            IconsConstant.notification,
                          ),
                          onPressed: () {
                            Get.snackbar(
                              'Coming soon',
                              'Fitur ini akan segera hadir!',
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
          Column(
            children: [
              HomeProductCarouselWidget(aspectRatio: aspectRatio),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 38),
                        HomeCategoryProductWidget(key: keyHomeCategoryProduct),
                        const SizedBox(height: 12),
                        HomeRecomendedProductWidget(
                            key: keyHomeRecomendedProduct),
                      ],
                    ),
                  ),
                  Positioned(
                    top: -130,
                    left: 0,
                    right: 0,
                    child: HomeUserDetailWidget(key: keyHomeUserDetail),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
