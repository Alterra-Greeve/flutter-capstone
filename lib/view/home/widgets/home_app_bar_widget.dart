part of '../screens/home_screen.dart';

class HomeAppBarWidget extends StatelessWidget {
  const HomeAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {

    final HomeController homeController = Get.put(HomeController());
    return Obx(
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
                          style: TextStylesConstant.nunitoSubtitle4.copyWith(
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
                    onPressed: () {
                      Get.toNamed(AppRoutes.membership);
                    },
                    child: Text(
                      'Membership',
                      style: TextStylesConstant.nunitoButtonLarge.copyWith(
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
    );
  }
}
