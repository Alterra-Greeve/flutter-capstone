part of '../screens/membership_screen.dart';

class MembershipButtonGetMembershipWidget extends StatelessWidget {
  final MembershipController membershipController =
      Get.put(MembershipController());

  MembershipButtonGetMembershipWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Obx(
        () => GlobalFormButtonWidget(
          text: 'Dapatkan Membership',
          onTap: () {
            if (membershipController.isFormValid) {
              membershipController.selectMembershipPrice(
                membershipController.isSelectedMap.entries
                    .firstWhere((entry) => entry.value)
                    .key,
              );
              _showBottomSheet(context);
            }
          },
          isLoading: membershipController.isLoading.value,
          isFormValid: membershipController.isFormValid,
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text('Konfirmasi Pembayaran',
                  style: TextStylesConstant.nunitoSemiboldTitle),
              const SizedBox(height: 12),
              Text(
                'Kamu hampir selesai! Segera nikmati semua manfaat kami setelah melakukan pembayaran sebesar ${membershipController.selectedMembershipPrice.value} Jika semuanya sudah sesuai, silakan lanjutkan pembayaran dengan menekan tombol di bawah ini.',
                style: TextStylesConstant.nunitoSubtitle2
                    .copyWith(color: ColorsConstant.neutral600),
              ),
              const SizedBox(height: 16),
              GlobalFormButtonWidget(
                isLoading: membershipController.isLoading.value,
                isFormValid: true,
                text: 'Bayar',
                onTap: () {
                  membershipController.postUserMembership();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
