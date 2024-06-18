part of 'membership_screen.dart';

class MembershiSuccessfullyScreen extends StatelessWidget {
  const MembershiSuccessfullyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MembershipController membershipController =
        Get.put(MembershipController());

    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: GlobalButtonWidget(
          text: 'Kembali ke Beranda',
          onTap: () {
            Get.offAllNamed(AppRoutes.bottomNavigation);
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  ImagesConstant.successMembership,
                ),
                const SizedBox(height: 20),
                RichText(
                  overflow: TextOverflow.clip,
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Pembayaran Berhasil!\n',
                        style: TextStylesConstant.nunitoTitleBold.copyWith(
                          color: ColorsConstant.neutral900,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      TextSpan(
                        text: 'Nikmati Manfaat Membershipmu 🎉',
                        style: TextStylesConstant.nunitoTitleBold.copyWith(
                          color: ColorsConstant.neutral900,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  'Terima kasih atas pembayaranmu sebesar ${membershipController.selectedMembershipPrice.value}untuk membership. Kami dengan senang hati mengonfirmasi bahwa pembayaranmu telah berhasil. ',
                  style: TextStylesConstant.nunitoCaption,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
