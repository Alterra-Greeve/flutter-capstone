part of '../screens/home_screen.dart';

class HomeUserDetailWidget extends StatelessWidget {
  const HomeUserDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());
    return Obx(
      () {
        final userProfile = homeController.userProfileData.value;

        if (homeController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
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
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            padding: const EdgeInsets.fromLTRB(
              24,
              24,
              24,
              12,
            ),
            decoration: BoxDecoration(
              color: ColorsConstant.neutral50,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: ColorsConstant.neutral500,
                width: 1,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                HomeUserDetailItemWidget(
                  iconPath: SvgPicture.asset(
                    IconsConstant.poinXp,
                    height: 30,
                  ),
                  titleItem: 'Exp',
                  valueItem: userProfile.data?.exp,
                ),
                const SizedBox(height: 16),
                HomeUserDetailItemWidget(
                  iconPath: SvgPicture.asset(
                    IconsConstant.coin,
                    height: 30,
                  ),
                  titleItem: 'Koin',
                  valueItem: userProfile.data?.coin,
                ),
                const SizedBox(height: 16),
                HomeUserDetailItemWidget(
                  iconPath: Image.asset(
                    IconsConstant.poinImpact,
                    height: 30,
                  ),
                  titleItem: 'Dampak',
                  valueItem: userProfile.data?.impactPoint,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
